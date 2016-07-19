#!/bin/bash
TESTOPIA_ALL_JS='testopia.all.js'
TESTOPIA_ALL_YCOMP_JS='testopia.all.ycomp.js'
YUICOMPRESS_BIN="$HOME/bin/yuicompressor-2.4.8.jar"


function concat_js() {
    local js_src_list=()
    js_src_list+=('js/strings.js')
    js_src_list+=('js/vars.js')
    js_src_list+=('js/util.js')
    js_src_list+=('js/attachments.js')
    js_src_list+=('js/plan.js')
    js_src_list+=('js/case.js')
    js_src_list+=('js/caserun.js')
    js_src_list+=('js/run.js')
    js_src_list+=('js/build.js')
    js_src_list+=('js/category.js')
    js_src_list+=('js/diff-tabs.js')
    js_src_list+=('js/environment.js')
    js_src_list+=('js/product.js')
    js_src_list+=('js/search.js')
    js_src_list+=('js/tags.js')

    cat "${js_src_list[@]}" > $TESTOPIA_ALL_JS
}

function build_js() {
    if [[ -f "$YUICOMPRESS_BIN" ]]; then
        java -jar "$YUICOMPRESS_BIN" --type js -o "$TESTOPIA_ALL_YCOMP_JS" "$TESTOPIA_ALL_JS"
    else
        echo "Missing yuicompress file!!!"
        exit
    fi
}

function main() {
    cat_js
    build_js
}

main
