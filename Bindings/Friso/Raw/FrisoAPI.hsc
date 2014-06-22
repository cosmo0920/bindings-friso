{-# OPTIONS_GHC -fno-warn-unused-imports #-}
#include <bindings.dsl.h>
#include <friso/friso_API.h>
module Bindings.Friso.Raw.FrisoAPI where
import Foreign.Ptr
#strict_import

{- typedef unsigned short ushort_t; -}
#synonym_t ushort_t , CUShort
{- typedef unsigned char uchar_t; -}
#synonym_t uchar_t , CUChar
{- typedef unsigned int uint_t; -}
#synonym_t uint_t , CUInt
{- typedef char * fstring; -}
#synonym_t fstring , CString
{- typedef struct {
            fstring buffer; uint_t length; uint_t allocs;
        } string_buffer_entry; -}
#starttype string_buffer_entry
#field buffer , CString
#field length , CUInt
#field allocs , CUInt
#stoptype
{- typedef string_buffer_entry * string_buffer_t; -}
#synonym_t string_buffer_t , <string_buffer_entry>
#ccall new_string_buffer_with_opacity , CUInt -> IO (Ptr <string_buffer_entry>)
#ccall new_string_buffer_with_string , CString -> IO (Ptr <string_buffer_entry>)
#ccall string_buffer_append , Ptr <string_buffer_entry> -> CString -> IO ()
#ccall string_buffer_append_char , Ptr <string_buffer_entry> -> CString -> IO ()
#ccall string_buffer_insert , (Ptr <string_buffer_entry>) -> CUInt -> CString -> IO ()
#ccall string_buffer_remove , Ptr <string_buffer_entry> -> CUInt -> CUInt -> IO CString
#ccall string_buffer_trim , Ptr <string_buffer_entry> -> IO (Ptr <string_buffer_entry>)
#ccall string_buffer_devote , Ptr <string_buffer_entry> -> IO CString
#ccall string_buffer_clear , Ptr <string_buffer_entry> -> IO ()
#ccall free_string_buffer , Ptr <string_buffer_entry> -> IO ()
{- typedef struct {
            fstring source;
            uint_t srcLen;
            fstring delimiter;
            uint_t delLen;
            uint_t idx;
        } string_split_entry; -}
#starttype string_split_entry
#field source , CString
#field srcLen , CUInt
#field delimiter , CString
#field delLen , CUInt
#field idx , CUInt
#stoptype
{- typedef string_split_entry * string_split_t; -}
#synonym_t string_split_t , <string_split_entry>
#ccall new_string_split , CString -> CString -> IO (Ptr <string_split_entry>)
#ccall string_split_reset , Ptr <string_split_entry> -> CString -> CString -> IO ()
#ccall string_split_set_source , Ptr <string_split_entry> -> CString -> IO ()
#ccall string_split_set_delimiter , Ptr <string_split_entry> -> CString -> IO ()
#ccall free_string_split , Ptr <string_split_entry> -> IO ()
#ccall string_split_next , Ptr <string_split_entry> -> CString -> IO CString
{- typedef struct {
            void * * items; uint_t allocs; uint_t length;
        } friso_array_entry; -}
#starttype friso_array_entry
#field items , Ptr (Ptr ())
#field allocs , CUInt
#field length , CUInt
#stoptype
{- typedef friso_array_entry * friso_array_t; -}
#synonym_t friso_array_t , <friso_array_entry>
#ccall new_array_list_with_opacity , CUInt -> IO (Ptr <friso_array_entry>)
#ccall free_array_list , Ptr <friso_array_entry> -> IO ()
#ccall array_list_add , Ptr <friso_array_entry> -> Ptr () -> IO ()
#ccall array_list_insert , Ptr <friso_array_entry> -> CUInt -> Ptr () -> IO ()
#ccall array_list_get , Ptr <friso_array_entry> -> CUInt -> IO (Ptr ())
#ccall array_list_set , Ptr <friso_array_entry> -> CUInt -> Ptr () -> IO (Ptr ())
#ccall array_list_remove , Ptr <friso_array_entry> -> CUInt -> IO (Ptr ())
#ccall array_list_trim , Ptr <friso_array_entry> -> IO (Ptr <friso_array_entry>)
#ccall array_list_clear , Ptr <friso_array_entry> -> IO (Ptr <friso_array_entry>)
{- struct friso_link_node {
    void * value;
    struct friso_link_node * prev;
    struct friso_link_node * next;
}; -}
#starttype struct friso_link_node
#field value , Ptr ()
#field prev , Ptr <struct friso_link_node>
#field next , Ptr <struct friso_link_node>
#stoptype
{- typedef struct friso_link_node link_node_entry; -}
#synonym_t link_node_entry , <struct friso_link_node>
{- typedef link_node_entry * link_node_t; -}
#synonym_t link_node_t , <struct friso_link_node>
{- typedef struct {
            link_node_t head; link_node_t tail; uint_t size;
        } friso_link_entry; -}
#starttype friso_link_entry
#field head , <struct friso_link_node>
#field tail , <struct friso_link_node>
#field size , CUInt
#stoptype
{- typedef friso_link_entry * friso_link_t; -}
#synonym_t friso_link_t , <friso_link_entry>
#ccall new_link_list , IO (Ptr <friso_link_entry>)
#ccall free_link_list , Ptr <friso_link_entry> -> IO ()
#ccall link_list_clear , Ptr <friso_link_entry> -> IO (Ptr <friso_link_entry>)
#ccall link_list_add , Ptr <friso_link_entry> -> Ptr () -> IO ()
#ccall link_list_insert_before , Ptr <friso_link_entry> -> CUInt -> Ptr () -> IO ()
#ccall link_list_get , Ptr <friso_link_entry> -> CUInt -> IO (Ptr ())
#ccall link_list_set , Ptr <friso_link_entry> -> CUInt -> Ptr () -> IO (Ptr ())
#ccall link_list_remove , Ptr <friso_link_entry> -> CUInt -> IO (Ptr ())
#ccall link_list_remove_node , Ptr <friso_link_entry> -> (Ptr <struct friso_link_node>) -> IO (Ptr ())
#ccall link_list_remove_first , Ptr <friso_link_entry> -> IO (Ptr ())
#ccall link_list_remove_last , Ptr <friso_link_entry> -> IO (Ptr ())
#ccall link_list_add_last , Ptr <friso_link_entry> -> Ptr () -> IO ()
#ccall link_list_add_first , Ptr <friso_link_entry> -> Ptr () -> IO ()
{- struct hash_entry {
    fstring _key; void * _val; struct hash_entry * _next;
}; -}
#starttype struct hash_entry
#field _key , CString
#field _val , Ptr ()
#field _next , Ptr <struct hash_entry>
#stoptype
{- typedef struct hash_entry friso_hash_entry; -}
#synonym_t friso_hash_entry , <struct hash_entry>
{- typedef friso_hash_entry * hash_entry_t; -}
#synonym_t hash_entry_t , <struct hash_entry>
#callback fhash_callback_fn_t , Ptr <struct hash_entry> -> IO ()
{- typedef struct {
            uint_t length;
            uint_t size;
            float factor;
            uint_t threshold;
            hash_entry_t * table;
        } friso_hash_cdt; -}
#starttype friso_hash_cdt
#field length , CUInt
#field size , CUInt
#field factor , CFloat
#field threshold , CUInt
#field table , Ptr <struct hash_entry>
#stoptype
{- typedef friso_hash_cdt * friso_hash_t; -}
#synonym_t friso_hash_t , <friso_hash_cdt>
#ccall new_hash_table , IO (Ptr <friso_hash_cdt>)
#ccall free_hash_table , Ptr <friso_hash_cdt> -> <fhash_callback_fn_t> -> IO ()
#ccall hash_put_mapping , Ptr <friso_hash_cdt> -> CString -> Ptr () -> IO ()
#ccall hash_exist_mapping , Ptr <friso_hash_cdt> -> CString -> IO CInt
#ccall hash_get_value , Ptr <friso_hash_cdt> -> CString -> IO (Ptr ())
#ccall hash_remove_mapping , Ptr <friso_hash_cdt> -> CString -> IO (Ptr <struct hash_entry>)
