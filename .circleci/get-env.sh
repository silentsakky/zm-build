#!/bin/bash

set -x
set -e
set -o pipefail

export _GLEANED_VER="$(.circleci/misc/glean_version.pl)"
export ZIMBRA_CI_BUILD_TYPE="${ZIMBRA_CI_BUILD_TYPE-FOSS}"
export ZIMBRA_CI_BUILD_HOSTNAME="${ZIMBRA_CI_BUILD_HOSTNAME-zimbra.org}"
export ZIMBRA_CI_BUILD_RELEASE_CANDIDATE="${ZIMBRA_CI_BUILD_RELEASE_CANDIDATE-beta}"
export ZIMBRA_CI_BUILD_RELEASE_NO="${ZIMBRA_CI_BUILD_RELEASE_NO-$_GLEANED_VER}"
export ZIMBRA_CI_BUILD_RELEASE="${ZIMBRA_CI_BUILD_RELEASE-$CIRCLE_PROJECT_USERNAME}"
export ZIMBRA_CI_THIRDPARTY_SERVER="${ZIMBRA_CI_THIRDPARTY_SERVER-zdev-vm008.eng.zimbra.com}"
export ZIMBRA_CI_DEPLOY_HOSTNAME="${ZIMBRA_CI_DEPLOY_HOSTNAME-files.zimbra.com}"
export ZIMBRA_CI_DEPLOY_PATH="${ZIMBRA_CI_DEPLOY_PATH-dev-releases}"
export ZIMBRA_CI_GIT_DEFAULT_BRANCH="${ZIMBRA_CI_GIT_DEFAULT_BRANCH-$CIRCLE_BRANCH,develop}"

# customizations for build.pl
export ENV_ENABLE_ARCHIVE_ZIMBRA_FOSS=1
export ENV_RESUME_FLAG=1
export ENV_GIT_UPDATE_INCLUDE=@

export ZIMBRA_CI_OVERRIDES="--git-overrides=zm-web-client.branch=feature/universal-ui --git-overrides=zm-ajax.branch=feature/universal-ui --git-overrides=zm-zimlets.branch=feature/universal-ui --build-release-no=8.8.5 --build-release-candidate=BETA"
