'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "575179eec9c8b72cf74d1f2327395702",
"version.json": "50881568aa842c340fe8071db004166c",
"index.html": "e73b75b7153f25cdb9b7aa4631bc46af",
"/": "e73b75b7153f25cdb9b7aa4631bc46af",
"main.dart.js": "f949e543fa5eb66a09a1c8222a0d688a",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"favicon.png": "595bcbdfd6feba1b756acb9e91f39b6b",
"icons/Icon-192.png": "606285e22cb23d3365cfc2b31a04f06f",
"icons/Icon-maskable-192.png": "606285e22cb23d3365cfc2b31a04f06f",
"icons/Icon-maskable-512.png": "1ba4558da1aad93090960ea0ec8f08a9",
"icons/Icon-512.png": "1ba4558da1aad93090960ea0ec8f08a9",
"manifest.json": "db40d283b0a25024d3e1583cb5cbde3d",
".git/config": "89018d1c44220365990665e5545cd11d",
".git/objects/59/8401f7db119454c9591fd37d5546fa3ee23985": "4e5af5accd59d6496bd62cbe11f6af2a",
".git/objects/0c/d2e06160da1ec47cc234811c6355e45e25910f": "e5d8cd402a155280f36bdfedffe1eff8",
".git/objects/3e/23a2921ebc6143e5ad55ba0317c6e840bfb30d": "2d9bc38903228a5a7bb2132e252a03e8",
".git/objects/3b/7a25e87ddd80aa06fa6b8689c17ce2f27c0471": "90a0371d81e494edd2bb5f15985dd623",
".git/objects/6f/985442cd8f8567d22532ab14d2754eab8daf53": "a3f9eacd7f666214fa8ff797c9ed9a95",
".git/objects/9b/5d9e81c6470c5733c6c9603ec9dc19db8129ef": "ab2f91c0281f04b9115035a89c4576c4",
".git/objects/9e/5b2d938fb796a56d5d457e95601b100b3bb1f6": "d4fff792795ff73fb172ce279f77d139",
".git/objects/35/ef4589f577b4d009be9ad3f69ece59d4a10af1": "dd2f533995786f9821f45e2967bcda47",
".git/objects/35/9cab337ae1b0fad3ab5cc4f55fe3348e9f0480": "053c16f3b6dc17b2bfba9767d13792ea",
".git/objects/3d/918498cdd53ffa72aee839d1aef7d653401263": "9bf368572d13e44f99f6f19d66d92620",
".git/objects/58/b007afeab6938f7283db26299ce2de9475d842": "6c6cbea527763bb3cdff2cecfee91721",
".git/objects/58/356635d1dc89f2ed71c73cf27d5eaf97d956cd": "f61f92e39b9805320d2895056208c1b7",
".git/objects/67/79c386dde14acc6f1a7b2cacdf6f30668fca34": "d538f643c9553b20a505f7aeb5104dd8",
".git/objects/67/a6557c8c147a3fa3820003d22111a14230600f": "4ce9785919d6a6de0367bfa1dee4c345",
".git/objects/93/6c02c71866903bd48793aee24c8cce1aab8212": "fca4fa9da8f61afbfd5eff097403e5db",
".git/objects/93/313252defdbab6c971c434caebe038b94cb100": "678ce30595ce18798e5da17447d74232",
".git/objects/94/f7d06e926d627b554eb130e3c3522a941d670a": "77a772baf4c39f0a3a9e45f3e4b285bb",
".git/objects/5a/7ca611f5b18da14131190c9c78b7ba9d1cdb02": "3047e1fe2575066e4098db4870e40779",
".git/objects/05/34d3086443762f3b0734b755107267c4f67d42": "868008a9bd0a390803c3778dddefb2ba",
".git/objects/9d/50455ff2728585e7a7d2127bedc8d2012ab0f7": "d5ded1907691e903bc552237bf1dbaec",
".git/objects/9c/b8b3da3374f3064e97b75f9a67702d250e29c4": "5f75991c5fb0795a81aad040d0f2bb3c",
".git/objects/9c/29605850ef40d530e0fa87f864b1e1bd66e0e0": "ed6b740751eca8992d720a01d6bcaa5e",
".git/objects/b2/0777bebcb6004d698f8bbcada9ed569702254c": "3ff33cebf9cc718013099f4664e2d561",
".git/objects/d9/908f8cb8f114cafa60c4a6790f5ef3fbfd0263": "7b24230ec03f4e1f480e01a0b7dbe43a",
".git/objects/bb/0c2597c255b4d3024fd3330810b757a78bfb0c": "6a0af712e8558f98631d7d7c051e5558",
".git/objects/d7/ae130bc55c3ed87d70e76fb0913b202cd2b4b7": "5710fc792976e3ddaabdad7b7a33523f",
".git/objects/d0/c1438bf8dcb6489e0663d400b136f598e8a03e": "78aafda0a5762b0153f0cfce27ebad7b",
".git/objects/be/e5802965e417e95a7919c98f4294fce8e835e7": "446ba9b1de50d566f8357b7f39de42c7",
".git/objects/b3/eb78be4e40bcf8ebda133b752e451f9b7317a0": "0e151e3c8fd2a37f4476181e65e7f54c",
".git/objects/b3/ebbd38f666d4ffa1a394c5de15582f9d7ca6c0": "23010709b2d5951ca2b3be3dd49f09df",
".git/objects/b3/6f71e35bf5906d7bdd8f67c3a0e688936ff102": "3b011cca432b71a2ab719fe33fd014b9",
".git/objects/b4/a3ecb9428e2a4b8aff40c099e1c27d64a928f0": "6e4bc29289eb6be950713f1b329eaf0d",
".git/objects/d1/5daafb560952e42c31d19eab2de7be75602e8f": "74ae37c90771b479791758eacd9b580d",
".git/objects/d1/098e7588881061719e47766c43f49be0c3e38e": "f17e6af17b09b0874aa518914cfe9d8c",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/bc/55539e336a4200f509193d6bca324f7a94380b": "c99dc691fc2226fdecee44f71d629b78",
".git/objects/ae/161325891c0a22942132e4d9124e18ae4eea24": "8e4b6692bac9ec975835c54bf7d0e286",
".git/objects/e5/8298d822df826e4078a4b9e954a592e54a3efa": "d10abcfcb44d19932a7c789f1e4718f1",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ee/2a5e94c2347d9d4b9890b61c56284c5e33b862": "8992a214f07cc409f305195f021b7fa1",
".git/objects/c9/bf8af1b92c723b589cc9afadff1013fa0a0213": "632f11e7fee6909d99ecfd9eeab30973",
".git/objects/fc/3ae81cbf8ce9a9b6e6ffd7453054b92fcbf856": "2744e895e2da68ef8be9465f6e9482d9",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/ca/8482c88c44dcfdf9ead9d3726df9574ac9775c": "81cbf504c8b90bc81a07b514349a4ac5",
".git/objects/c1/8640d428482fa66076e08326bae6d85b426eed": "14230fb6968e2f123dc335a0ee7e519a",
".git/objects/c6/35982a2b29c314a0f8e224c09bfa1c777598f4": "f96e5065eda1181f0af6ff381ad17146",
".git/objects/ec/6d8017216d250d76cc9d7a2df77fc52e669c08": "f62aa1c976a0b03b22ea9fdce87d7ba5",
".git/objects/20/cb2f80169bf29d673844d2bb6a73bc04f3bfb8": "b807949265987310dc442dc3f9f492a2",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/18/eb401097242a0ec205d5f8abd29a4c5e09c5a3": "4e08af90d04a082aab5eee741258a1dc",
".git/objects/27/9dd955de0e8bf11a6cb1c4c792749cc12d0443": "eaa9aa39dd6d0d3c2d8b4084e91709d5",
".git/objects/27/62a6c157040375359d67394e9c837c5f478650": "ec8e3df0dab6d403e02bcadbf30ac6e9",
".git/objects/7d/8baf0d83306963689dae0d7cb2f1b17acc805d": "c621b9f35d39246a18fbba90c6629e4c",
".git/objects/7c/09d499f23e8c9cfadbd067e09e62b423cd8b4a": "4f5d6ea007527788d254cd3ceeb9b8a8",
".git/objects/45/b352e41393a67fc27fe814b1da35569a8df68f": "667a9c6ada3b70d5edb929e90c67d75b",
".git/objects/87/9524e5926b7acf08075aed7829ed184b30a27d": "981806dfadbe9995467e4981f19f9ae5",
".git/objects/1a/39b10233d1a84964a3b4549dc3752ae03a4a89": "9d7e4aa6dfeca2e11221ad69c09b21e0",
".git/objects/28/6aa02be7538a07d214e92472533c2139e264cb": "a5365f020f0e883e9a0854fefa4d7d16",
".git/objects/7b/ee4dbf8bb2274f61ab41c5c813b762c19d33f1": "20596b5c62e8fe127d63f54a665fe6bc",
".git/objects/8f/1945df3168f4d8259db64993ce1c4527d258ca": "9aced96fa1914f6eae5219d8da178884",
".git/objects/8f/892ab7ce789704b42a9ccc945f6fa4142308ee": "ae2fb4c5e8b6c30b65fb30f7fd13379e",
".git/objects/8a/b1cf05337d4f66fbe4aca371402aaefedf8c08": "ffed74267d0143a4164eeb4885fe65cb",
".git/objects/8a/26be205956353ab45b18b21669ac9f539131a2": "9200062a1d19136f482cedb2cad57a92",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/26/21c08c99c341d79a275dd7e19a6e6e7331c287": "034375af1a1eb11ea32749fc8a14cd58",
".git/objects/81/c97e6c1aaa352ae0a89933ecb54643c4b8bc5c": "976a6b09aca78deb0b8c250062084bbd",
".git/objects/81/b2bd2b3d585121d560bfb5ec90fda3a62d3088": "76e057735dee061f8a70402ab7cfe401",
".git/objects/72/7aad80396e012797393d7c93851b2333afb138": "a84c50f69ca81fc9611c66743aef32b8",
".git/objects/2f/5e4054d5b1faedefe8e8fd402dfd9517de23ed": "ffd494275a2326a8948fb9d3c9763c8c",
".git/objects/2f/e2ec1adeae6acd982c14e693514adf7f64a93c": "739b64d4833e5b82eaa3f73b1864ffdc",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/88/98cf2a7f54d877f40c6a934847d67288cc6636": "1e3309a57ef77df3ef557885fde6d5e1",
".git/objects/6b/3e676365bcf5ad72c3ff061a5160597a9cb0b7": "b73afdda1af38e6e1fc8f0b980c0744a",
".git/objects/07/d21f66339eebcbb78e9b61cd0dba121ecc41c3": "7c7f5d187dbbf670308956f70411f832",
".git/objects/36/bdee6d5665364677398ab9218c8ffc56d98500": "a18ad018a318abd6144a7ab8127f2fa6",
".git/objects/09/4bb6ae24f0cd847d40cb4cc4a2434f2ec9b83b": "b9e6d850322c11db635bcf0a45b762ff",
".git/objects/09/5e5e56daecf3e9543234315190e158001f97db": "9671186e9a093330f645b390ee2b7355",
".git/objects/31/c37608e174d9b495fed160e144b6f5a6973c6c": "547021f8fb735844eabc296d68476e1c",
".git/objects/3a/2989dcc5b4e50683001e332fe71bd14cebf227": "71ef239cfdf818a94f3f5a367a990000",
".git/objects/3a/bf18c41c58c933308c244a875bf383856e103e": "30790d31a35e3622fd7b3849c9bf1894",
".git/objects/3f/c214edc77513dfda76dc196262f715d81026f5": "89f6e184c0e5cc46fb462b6158d1b089",
".git/objects/3f/f0ec8016ff04486f2bc12efa1765af23371d39": "b34154eee3efdfd60aedafdbe9c3b3da",
".git/objects/30/08e7ddb2f9db62b974d7a099e392edcb2e1f7e": "abdf8036e702f4beae191f3a4fa41ff6",
".git/objects/08/84ddd375f5bc8fcf9ee9e2d44e162022232bf4": "d015d1f81628ea47cdc9d255ec663b94",
".git/objects/6d/ddae3bb5cf585d6d8fde1ed0579ee2a7a0f3ad": "6a2c703e5028300ceeebc27e2c718e8a",
".git/objects/01/d5e63dd5da8690da7c38e4b7a751a67df5049f": "ca1a5213d4eeb3b84702f9d2578ee148",
".git/objects/06/470c8d35edd080e5616a743fd6e9ab340af123": "ed07850157ceb7ee0b7d781dfbefe9dd",
".git/objects/06/3e4605cc4f1d069dee14881be5d99e16b3cbfc": "dac7a13370f0d514f90ab9f42f46d50a",
".git/objects/39/2884a0802c0b91d764db462a8123e628243a24": "f7acba1a5a8502f18e1c2bbcdda098a6",
".git/objects/97/75bf73ff0e722c4420625918c39651464cb024": "0660b6f74ec86b85af4d0989b22ddde6",
".git/objects/0f/95c971d68e9aa030f50644811e90b78e8be15a": "707a0bf5c839822f8ff3f1541613ab7c",
".git/objects/0f/d670fee262a07d938aadbd9df026fdb1035158": "f3702cf83cc9dcede7a8cc9a1cb8a883",
".git/objects/0f/1c2fb89bc6e00ecbd899a82af928324cefc036": "81f3c1c65666bec6d86e17e1f1c3247c",
".git/objects/64/b3fbd4974571b17cd9d9671ae90a1686d311b8": "9b4e9c20daeddd49a6614cc93a8b9a5f",
".git/objects/bf/4099c1f4eb417484972144a98d15f6243a84f3": "79c0bc56bd98a127ff1c9185c0a19ec0",
".git/objects/bf/ddf8bea0e7b05c0c6e2c8a0fb66d5dd80f5fdb": "354625dd3c8a0e2185fc5e30fc1cc73e",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/a7/591809e6b2dd774e796789e80d8ea7aa89e6d4": "211f388eb687fd75da91534bbdd530b8",
".git/objects/b8/bd5eb77340aa5d7de525ee181689638e21ee97": "9ae6af0987d7d59364bffcb957a4427f",
".git/objects/dc/fda7633d9fc091f9c4b68d9ba0508fb3e16af3": "46831232df1932f361469791b2e411f5",
".git/objects/b6/8ad486bea43a4c8e6cce4d281bbfcf60ef629b": "6ec533370735e44f233129b7611ec9c5",
".git/objects/a9/4828ea674a905026e432500bf5e471b341cfac": "eaa207f0758422c0222171869b60982a",
".git/objects/aa/e82ff7bb15465f3de95d0261ad374daf2016e1": "e3f4843efde855f5c507d53dbf05653e",
".git/objects/af/3bfb0eb90cd0e1ddef38530c8a21fcc9debbab": "9121a010bbcc3ac40b34ce9eb9c466e2",
".git/objects/b7/4f8b66ada8d562cbe8084fe1a94d622b71a158": "11525fada2a781b9609adf72b1f6d930",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/a8/1552b4d7d624a569581a3ceda136bb5bc2a24b": "ea72ea1cbce1d4490e4129eee6eff407",
".git/objects/a8/430c4453392775393204049905ae8a60088e94": "9df81e89220eb58e7ca02ade4024d3a6",
".git/objects/a8/e35b73883f87c419e5c330bd4a7e0a55c8685b": "a5947405fb2e6fc96edfcdd0b5281613",
".git/objects/b0/30ac48e7afd81fc25182d188df8f253e44a798": "1bfd1dc0400a6cfb23e7d9f8ecc25e0e",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ea/1ba3fc5eedc8d92090853baede4e633ccbf149": "48d9a42a3e6e6811d74f4e284ed81a12",
".git/objects/cd/88b08ce8ff1decdd862dfc94c9c4dfdc47d59e": "31557902154114c5195e08c9ea0d62d1",
".git/objects/e6/9de29bb2d1d6434b8b29ae775ad8c2e48c5391": "c70c34cbeefd40e7c0149b7a0c2c64c2",
".git/objects/e6/1e8a895af0d09fa792e2c21582ff6b4d9ec47e": "4999cb6511f8a61378698ac30a15ac41",
".git/objects/f0/63ec46228ae0c178a9d4f4edd76d7e1b5cb076": "c0429f69df33533e1a0e4d90040d8ee4",
".git/objects/f6/da8fe4017320958afd013d3a33837d6cdf7028": "34e4c02d6d63337039a36881426cf5dd",
".git/objects/e9/bd308a0185877dc99fa635e95081bf109aa0d7": "cbcd2c56c537b32cd6020ab02dc5c842",
".git/objects/cb/b5321a775b79d0386b71f9177c2c51b435beb8": "f7933f09d36b7a6e7b557d7154e70fa2",
".git/objects/cb/12bed2a57c92f4ef148382698c690e02724038": "7387ef737c5a4c869bb1cce0fd476ed6",
".git/objects/e0/3eb21f05649c7eaa57fb7251b5f7ba5ac01bdf": "374814d9543fd95fd0f4d0466472ec5d",
".git/objects/2c/271ac534b27685af01080dfa53f775737feb5f": "e4bcb0d79cc3a39a8a58145b9d21261d",
".git/objects/79/faa6f2236e9bf0cdc5414aa27b6ba6dd89ff12": "eafabae332cafa3f279c56118cf682a8",
".git/objects/79/8e748c002afdf3182191b54bf2d388bbd9d6ac": "bde17838cfee7113a19c9b033f96b2ae",
".git/objects/79/93387df474638ba4138c4a8cab28214a37c500": "1b90f5b17c55f4ef62fe19ff6e34443f",
".git/objects/2d/089ed076142add10701bb9bc32172d7b213e4c": "1f8e67830fe8cc9a3b5c5724685457fd",
".git/objects/41/5c059c8094b888b0159fdedfd4e3cb08a8028e": "86914685ccd40e82a7fe5b70459fb9f7",
".git/objects/48/ea42116ce0f0095a484c4da5051f8fbf7ef079": "a62d1cafe4f6c6930e8a88559348e3f7",
".git/objects/8d/ef8d084483c648ca1b97e89af21045ffb87283": "86fcf2502814c87efcc6b6e021ac2602",
".git/objects/15/8a49e7f7d2f692cbf8b9616580e7b30390c91a": "6493e80746794d3457dcb6c288988864",
".git/objects/8c/99266130a89547b4344f47e08aacad473b14e0": "41375232ceba14f47b99f9d83708cb79",
".git/objects/85/69e8ac994e4e431966943487332f8d1331a7b1": "b8c17129fb90ea6bf3f5d001df070f89",
".git/objects/71/0a97e359eabafa5545caa2ea14de3dde04548f": "cb03a00fa4b6c5c6ef69f3d275efb920",
".git/objects/71/3f932c591e8f661aa4a8e54c32c196262fd574": "66c6c54fbdf71902cb7321617d5fa33c",
".git/objects/76/5812e7ab37ee02172141e833a8b34649d99eca": "91027f0209b5f3fa224fe648d0f1a135",
".git/objects/49/adebdb511c8c293b28db3f6792e5bac28cdc32": "ba6a3971e7f06834fd6ec3844372ce17",
".git/objects/49/5abf86ec63a84418a4dc0b3f9f17ce4423f521": "211372384fd919c118131113c5a53f7f",
".git/objects/2b/3d9b2e6845c4eb5f38c4faea2fcf76a72e8ddd": "fae8a08aaae8f205ec16ebec1fa63a2b",
".git/objects/47/0501fc9b706ebfb62b9e8b5723cb350327765f": "8b18996358a1cb604d7e1150cf661f78",
".git/objects/8b/544797bdfc199ce4348002644368d2dd6f03e0": "17e958d777ff3aa8e84ee892ec7175a6",
".git/objects/7a/77d794b46247ed5e439abb6455b1fe8fef4921": "dd177e0793b4f11e619b69e8494b472a",
".git/objects/25/e80ab431e328235a79a95da7a5822c222dd49b": "e49fc14263da1f9b1e530e0f985fd1ac",
".git/objects/25/86a656fd0a84c2ff812e4ea0c815355b4974e8": "16fe10e15bbbc2f69ae2d4856c807ed5",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "1641f2f1b0cdb890b3a35269f53ee76b",
".git/logs/refs/heads/main": "d8a196ed32b453d80750b884ed61cc6f",
".git/logs/refs/remotes/origin/main": "fde2d719b19bd340f02808e8ac69e8b3",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-commit.sample": "305eadbbcd6f6d2567e033ad12aabbc4",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/refs/heads/main": "5d78357fd8978a306fe125f95f06a67b",
".git/refs/remotes/origin/main": "5d78357fd8978a306fe125f95f06a67b",
".git/index": "1582743f66b1c4566188dd218286967c",
".git/COMMIT_EDITMSG": "9506db3e3a7b2370070475b2cad1ae27",
".git/FETCH_HEAD": "d41d8cd98f00b204e9800998ecf8427e",
"assets/AssetManifest.json": "690d27ea43501052ce8a519043b6b58b",
"assets/NOTICES": "7a414437ca9f2b2b4e74c80229837889",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "6f2747f985f99a83fd984176386d0437",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "9a32d52d01637fca32e658d468d6926d",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/assets/cons_virt_4.png": "94b82c26a4498a2f12a8fe29b128defd",
"assets/assets/trippster_6.png": "2d69261f7758e7c64c9ecfd11141498f",
"assets/assets/cons_virt_5.png": "49c9f02563616b8625bd6991bea66bec",
"assets/assets/trippster_5.png": "848e61c9a59ad3e79216936e081a71f7",
"assets/assets/trippster_4.png": "31e318af702856aef340d36c7568474b",
"assets/assets/cons_virt_2.png": "c313803501341ba6e6264a85f9a3b576",
"assets/assets/trippster_1.png": "37632ad6307db1e6b927c22c0fc72c5e",
"assets/assets/cons_virt_3.png": "97548f32c3a77c030d0e582af306f426",
"assets/assets/cons_virt_1.jpg": "b919dbc5faa9a0dc50fdd2f968b9fa0a",
"assets/assets/trippster_3.png": "508e9cea7717039f814a06bf8bb13125",
"assets/assets/trippster_2.png": "3edd9b8aef6e27b83a336e4f08526209",
"assets/assets/pubs_4.png": "e7fec7b666ec7445433f32da45963b82",
"assets/assets/AssetManifest.json": "2da1ff1b7a53393d300ddf56d1e5b750",
"assets/assets/pubs_3.png": "ae92cf7e098cb2036d7b27867bb5f3f2",
"assets/assets/bar.webp": "b5ced47042a93eb26996a00db6203b35",
"assets/assets/pubs_2.png": "7a01da84c83dff42d6d02d9948b2ca9a",
"assets/assets/icon.webp": "bbfe78bef58352666f54c790d1fb12ac",
"assets/assets/pubs_1.png": "939672a923d952ad965db5a623212296",
"assets/assets/NOTICES": "eef243bc548358b766ca8663f16434ff",
"assets/assets/mepet_4.png": "25a16ff10b3f751cee11c94327de8297",
"assets/assets/mepet_5.png": "ac991bda251a3353044df70a1db51178",
"assets/assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/assets/AssetManifest.bin.json": "7ed4b83667035cb0e5c82c48a0735f6b",
"assets/assets/mepet_2.png": "7b7ab63c456c30d983f41ca1535b09d3",
"assets/assets/mepet_3.png": "812ff868667369f3b0e791c2a10af442",
"assets/assets/mepet_1.png": "470e9f15662468ff5e4cf8b23d8f768a",
"assets/assets/AssetManifest.bin": "3082fa11f059a2b6ea32b5d773c3a7bb",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
