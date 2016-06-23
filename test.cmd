git clone https://github.com/ZombieHippie/fantastic-repository
cd fantastic-repository
git checkout feature/test-feature

PLUGIN_URL='$(cat uploads/diff-cover.url)'
PLUGIN_OUT='drone-status/diff-cover.status'
PLUGIN_SUCCEED_IF='function () {\n  var cov = /Coverage: ([\\d\\.]+)%/.exec(`$(cat reports/diff-cover.txt)`);\n  console.log(cov); return cov && parseFloat(cov[1]) > 30; /*`*/\n}()\n'

export PLUGIN_BODY=$PLUGIN_BODY

docker run --rm                             \
	 -e PLUGIN_URL=$PLUGIN_URL                \
	 -e PLUGIN_OUT=$PLUGIN_OUT                \
	 -e PLUGIN_SUCCEED_IF=$PLUGIN_SUCCEED_IF  \
	 -v $(pwd):$(pwd)            \
	 -w $(pwd)                   \
	 dryclean/drone-write-status

cd ..

