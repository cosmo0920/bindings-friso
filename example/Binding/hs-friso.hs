import Bindings.Friso.Raw
import Bindings.Friso.Util
import Foreign.C.String
import System.Exit
import Control.Monad
import Options.Applicative
import Data.Monoid

data App = App { iniFile :: String }
  deriving Show

runWithOption :: App -> IO String
runWithOption opts = do
  putStrLn ("InitWithFile: " ++ iniFile opts)
  return (iniFile opts)

optParse :: IO String
optParse = do
  let parser = App <$> strOption
                       ( short 'i'
                      <> long "init"
                      <> metavar "INITFILE"
                      <> help "specify friso.ini path")
      opts = info parser mempty
  ini <- execParser opts >>= runWithOption
  return ini

main :: IO ()
main = do
  -- init friso
  friso <- c'friso_new
  -- init friso config
  config <- c'friso_new_config

  -- init with config
  ini <- optParse
  configPath <- newCString ini
  init_result <- c'friso_init_from_ifile friso config configPath
  if init_result /= 1 then do
    -- when it cannot initialize, abort.
    c'friso_free friso
    exitFailure
  else do
    -- new friso task
    task <- c'friso_new_task
    _ <- forever $ do
      putStrLn "binding-friso>"
      line <- getLine
      when (line == "quit" || line == "q") $ do
        putStrLn "quit"
        c'friso_free_task task
        c'friso_free friso
        exitSuccess
      -- input to tokenize text
      text <- newCString line
      cstr <- peekCString text
      putStrLn $ "original text: " ++ cstr
      c'friso_set_text task text
      putStrLn "result:"
      -- execute tokenize
      c'friso_do_word friso config task
    c'friso_free_task task
    c'friso_free friso
  return ()
