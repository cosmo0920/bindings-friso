import Bindings.Friso.Raw
import Bindings.Friso.Util
import Foreign.C.String
import System.Exit
import Control.Monad

main :: IO ()
main = do
  -- init friso
  friso <- c'friso_new
  -- init friso config
  config <- c'friso_new_config

  -- init with config
  configPath <- newCString "/etc/friso/friso.ini"
  init_result <- c'friso_init_from_ifile friso config configPath
  if init_result /= 1 then do
    -- when it cannot initialize, abort.
    c'friso_free friso
    exitFailure
  else do
    -- new friso task
    task <- c'friso_new_task
    forever $ do
      putStrLn "binding-friso>"
      line <- getLine
      when (line == "quit" || line == "q") $ do
        putStrLn "quit"
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
