#!/bin/bash
set -eu -o pipefail

rm -rf freebayes
rm -rf vardict
PROJECT=somatic
bcbio_vm.py cwl --systemconfig=../bcbio_system.yaml $PROJECT.yaml


BASEDIR=`cd .. && pwd`
sed -i.bak "s#$BASEDIR/testdata#../../testdata#" $PROJECT-workflow/main-$PROJECT-samples.json
#cwltool --pack run_info-cwl-workflow/main-run_info-cwl.cwl > run_info-cwl-workflow/main-run_info-cwl-standalone.cwl