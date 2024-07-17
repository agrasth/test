#!/bin/bash

function on_execute() {
    local moduleName moduleVersion component version

    # pushd "${res_analyzer_manager_bitbucket_resourcePath}"
    # export AM_SCANNERS_SHARED_STRING=$int_scanner_credentials_secret
    # export AM_XSC_SHARED_STRING=$int_xsc_am_credentials_secret
    make build-linux
    make build-win
    make build-mac

    apt update
    apt install zip unzip
    .jfrog-pipelines/zip_it.sh
    # add_run_variables buildName=${JFROG_CLI_BUILD_NAME} buildNumber=${run_id}

    # moduleName="$(getGoModuleName "./go.mod")"
    # moduleVersion="$(go_getGoModuleVersionFromEnv "./go.mod")"
    # component="com.jfrog.xsc-analyzer-manager"
    # if ! version="$(release_getServiceVersionFromReleaseManifest "xsc_analyzer_manager")"; then
    #     version="${JFROG_CLI_BUILD_NUMBER}"
    # fi

    # genericRepo_upload_files "./*analyzerManager.zip" "${component}" "${version}"
    # buildInfo_publish
    # write_output anaman_buildinfo buildName="${JFROG_CLI_BUILD_NAME}" buildNumber="${JFROG_CLI_BUILD_NUMBER}" version="${version}" moduleName="${moduleName}"
}
