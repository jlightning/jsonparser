#!/bin/bash -eu

function compile_fuzzer {
  path=$1
  function=$2
  fuzzer=$3

  go-fuzz -func $function -o $fuzzer.a $path

  $CXX $CXXFLAGS $LIB_FUZZING_ENGINE $fuzzer.a -o $OUT/$fuzzer
}

git clone https://github.com/dvyukov/go-fuzz-corpus
zip corpus.zip go-fuzz-corpus/json/corpus/*

cp corpus.zip $OUT/fuzzparsestring_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzParseString fuzzparsestring

cp corpus.zip $OUT/fuzzeachkey_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzEachKey fuzzeachkey

cp corpus.zip $OUT/fuzzdelete_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzDelete fuzzdelete

cp corpus.zip $OUT/fuzzset_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzSet fuzzset

cp corpus.zip $OUT/fuzzobjecteach_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzObjectEach fuzzobjecteach

cp corpus.zip $OUT/fuzzparsefloat_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzParseFloat fuzzparsefloat

cp corpus.zip $OUT/fuzzparseint_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzParseInt fuzzparseint

cp corpus.zip $OUT/fuzzparsebool_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzParseBool fuzzparsebool

cp corpus.zip $OUT/fuzztokenstart_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzTokenStart fuzztokenstart

cp corpus.zip $OUT/fuzzgetstring_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzGetString fuzzgetstring

cp corpus.zip $OUT/fuzzgetfloat_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzGetFloat fuzzgetfloat

cp corpus.zip $OUT/fuzzgetint_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzGetInt fuzzgetint

cp corpus.zip $OUT/fuzzgetboolean_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzGetBoolean fuzzgetboolean

cp corpus.zip $OUT/fuzzgetunsafestring_seed_corpus.zip
compile_fuzzer github.com/jlightning/jsonparser FuzzGetUnsafeString fuzzgetunsafestring

