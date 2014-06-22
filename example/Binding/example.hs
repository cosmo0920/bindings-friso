import Bindings.Friso.Raw
import Bindings.Friso.Util
import Foreign.C.String
import System.Exit

main :: IO ()
main = do
  -- init friso
  friso <- c'friso_new
  config <- c'friso_new_config
  configPath <- newCString "/etc/friso/friso.ini"
  init_result <- c'friso_init_from_ifile friso config configPath
  if init_result /= 1 then do
    c'friso_free friso
    exitFailure
  else do
    task <- c'friso_new_task
    text <- newCString "要被分词的文本"
    cstr <- peekCString text
    putStrLn $ "original text: " ++ cstr
    c'friso_set_text task text
    putStrLn "result:"
    c'friso_do_word friso config task
    c'friso_free_task task
    c'friso_free friso
  return ()
