{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include "util.h"
module Bindings.Friso.Util where
import Bindings.Friso.Raw
import Foreign.Ptr
#strict_import

#ccall friso_do_word , Ptr <friso_entry> -> Ptr <friso_config_entry> -> Ptr <friso_task_entry> -> IO ()
#ccall friso_set_text_display , Ptr <friso_task_entry> -> CString -> IO ()
