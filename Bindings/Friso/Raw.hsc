{-# OPTIONS_GHC -fno-warn-unused-imports #-}
module Bindings.Friso.Raw where
#include <bindings.dsl.h>
#include <friso/friso.h>
import Foreign.Ptr
#strict_import

import Bindings.Friso.Raw.FrisoAPI
{- typedef enum {
            __LEX_CJK_WORDS__ = 0,
            __LEX_CJK_UNITS__ = 1,
            __LEX_ECM_WORDS__ = 2,
            __LEX_CEM_WORDS__ = 3,
            __LEX_CN_LNAME__ = 4,
            __LEX_CN_SNAME__ = 5,
            __LEX_CN_DNAME1__ = 6,
            __LEX_CN_DNAME2__ = 7,
            __LEX_CN_LNA__ = 8,
            __LEX_STOPWORDS__ = 9,
            __LEX_ENPUN_WORDS__ = 10,
            __LEX_EN_WORDS__ = 11,
            __LEX_OTHER_WORDS__ = 15,
            __LEX_NCSYN_WORDS__ = 16,
            __LEX_PUNC_WORDS__ = 17,
            __LEX_UNKNOW_WORDS__ = 18
        } friso_lex_t; -}
#integral_t friso_lex_t
#num __LEX_CJK_WORDS__
#num __LEX_CJK_UNITS__
#num __LEX_ECM_WORDS__
#num __LEX_CEM_WORDS__
#num __LEX_CN_LNAME__
#num __LEX_CN_SNAME__
#num __LEX_CN_DNAME1__
#num __LEX_CN_DNAME2__
#num __LEX_CN_LNA__
#num __LEX_STOPWORDS__
#num __LEX_ENPUN_WORDS__
#num __LEX_EN_WORDS__
#num __LEX_OTHER_WORDS__
#num __LEX_NCSYN_WORDS__
#num __LEX_PUNC_WORDS__
#num __LEX_UNKNOW_WORDS__
{- typedef friso_hash_t * friso_dic_t; -}
#synonym_t friso_dic_t , <friso_hash_cdt>
{- typedef struct {
            uchar_t length;
            uchar_t rlen;
            uchar_t type;
            uchar_t ctrlMask;
            uint_t offset;
            fstring word;
            friso_array_t syn;
            friso_array_t pos;
            uint_t fre;
        } lex_entry_cdt; -}
#starttype lex_entry_cdt
#field length , CUChar
#field rlen , CUChar
#field type , CUChar
#field ctrlMask , CUChar
#field offset , CUInt
#field word , CString
#field syn , <friso_array_entry>
#field pos , <friso_array_entry>
#field fre , CUInt
#stoptype
{- typedef lex_entry_cdt * lex_entry_t; -}
#synonym_t lex_entry_t , <lex_entry_cdt>
{- typedef enum {
            FRISO_UTF8 = 0, FRISO_GBK = 1
        } friso_charset_t; -}
#integral_t friso_charset_t
#num FRISO_UTF8
#num FRISO_GBK
{- typedef struct {
            friso_dic_t dic; friso_charset_t charset;
        } friso_entry; -}
#starttype friso_entry
#field dic , <friso_hash_cdt>
#field charset , <friso_charset_t>
#stoptype
{- typedef friso_entry * friso_t; -}
#synonym_t friso_t , <friso_entry>
{- typedef enum {
            __FRISO_SIMPLE_MODE__ = 1, __FRISO_COMPLEX_MODE__ = 2
        } friso_mode_t; -}
#integral_t friso_mode_t
#num __FRISO_SIMPLE_MODE__
#num __FRISO_COMPLEX_MODE__
{- typedef struct {
            ushort_t max_len;
            ushort_t r_name;
            ushort_t mix_len;
            ushort_t lna_len;
            ushort_t add_syn;
            ushort_t clr_stw;
            ushort_t keep_urec;
            ushort_t spx_out;
            ushort_t en_sseg;
            ushort_t st_minl;
            uint_t nthreshold;
            friso_mode_t mode;
            char kpuncs[13];
        } friso_config_entry; -}
#starttype friso_config_entry
#field max_len , CUShort
#field r_name , CUShort
#field mix_len , CUShort
#field lna_len , CUShort
#field add_syn , CUShort
#field clr_stw , CUShort
#field keep_urec , CUShort
#field spx_out , CUShort
#field en_sseg , CUShort
#field st_minl , CUShort
#field nthreshold , CUInt
#field mode , <friso_mode_t>
#array_field kpuncs , CString
#stoptype
{- typedef friso_config_entry * friso_config_t; -}
#synonym_t friso_config_t , <friso_config_entry>
{- typedef struct {
            uchar_t type;
            uchar_t length;
            uchar_t rlen;
            char pos;
            int offset;
            char word[128];
        } friso_hits_entry; -}
#starttype friso_hits_entry
#field type , CUChar
#field length , CUChar
#field rlen , CUChar
#field pos , CString
#field offset , CInt
#array_field word , CString
#stoptype
{- typedef friso_hits_entry * friso_hits_t; -}
#synonym_t friso_hits_t , <friso_hits_entry>
{- typedef struct {
            fstring text;
            uint_t idx;
            uint_t length;
            uint_t bytes;
            uint_t unicode;
            uint_t ctrlMask;
            friso_link_t pool;
            string_buffer_t sbuf;
            friso_hits_t hits;
            char buffer[7];
        } friso_task_entry; -}
#starttype friso_task_entry
#field text , CString
#field idx , CUInt
#field length , CUInt
#field bytes , CUInt
#field unicode , CUInt
#field ctrlMask , CUInt
#field pool , <friso_link_entry>
#field sbuf , <string_buffer_entry>
#field hits , <friso_hits_entry>
#array_field buffer , CString
#stoptype
{- typedef friso_task_entry * friso_task_t; -}
#synonym_t friso_task_t , <friso_task_entry>
#ccall friso_new , IO (Ptr <friso_entry>)
#ccall friso_init_from_ifile , Ptr <friso_entry> -> Ptr <friso_config_entry> -> CString -> IO CInt
#ccall friso_free , Ptr <friso_entry> -> IO ()
#ccall friso_new_config , IO (Ptr <friso_config_entry>)
#ccall friso_init_config , Ptr <friso_config_entry> -> IO ()
#ccall friso_new_task , IO (Ptr <friso_task_entry>)
#ccall friso_free_task , Ptr <friso_task_entry> -> IO ()
#ccall friso_new_hits , IO (Ptr <friso_hits_entry>)
#ccall friso_set_text , Ptr <friso_task_entry> -> CString -> IO ()
#ccall friso_next , Ptr <friso_entry> -> Ptr <friso_config_entry> -> Ptr <friso_task_entry> -> IO (Ptr <friso_hits_entry>)
#ccall friso_dic_new , IO (Ptr <friso_hash_cdt>)
-- #ccall file_get_line , CString -> Ptr <struct _IO_FILE> -> IO CString
#ccall friso_dic_free , Ptr <friso_hash_cdt> -> IO ()
#ccall new_lex_entry , CString -> Ptr <friso_array_entry> -> CUInt -> CUInt -> CUInt -> IO (Ptr <lex_entry_cdt>)
#ccall free_lex_entry , Ptr <lex_entry_cdt> -> IO ()
#ccall friso_dic_load , Ptr <friso_entry> -> Ptr <friso_config_entry> -> Ptr <friso_lex_t> -> CString -> CUInt -> IO ()
#ccall friso_dic_load_from_ifile , Ptr <friso_entry> -> Ptr <friso_config_entry> -> CString -> CUInt -> IO ()
#ccall friso_dic_add , Ptr <friso_hash_cdt> -> Ptr <friso_lex_t> -> CString -> Ptr <friso_array_entry> -> IO ()
#ccall friso_dic_add_with_fre , Ptr <friso_hash_cdt> -> Ptr <friso_lex_t> -> CString -> Ptr <friso_array_entry> -> CUInt -> IO ()
#ccall friso_dic_match , Ptr <friso_hash_cdt> -> Ptr <friso_lex_t> -> CString -> IO CInt
#ccall friso_dic_get , Ptr <friso_hash_cdt> -> Ptr <friso_lex_t> -> CString -> IO (Ptr <lex_entry_cdt>)
#ccall friso_spec_dic_size , Ptr <friso_hash_cdt> -> Ptr <friso_lex_t> -> IO CUInt
#ccall friso_all_dic_size , Ptr <friso_hash_cdt> -> IO CUInt
