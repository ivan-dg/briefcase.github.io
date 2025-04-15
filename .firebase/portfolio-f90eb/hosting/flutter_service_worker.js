'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "b8319ca562fe271b0dc30b61792195f9",
"version.json": "50881568aa842c340fe8071db004166c",
"index.html": "e73b75b7153f25cdb9b7aa4631bc46af",
"/": "e73b75b7153f25cdb9b7aa4631bc46af",
"main.dart.js": "33f114c4d1d77257563ba5765b790b68",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "595bcbdfd6feba1b756acb9e91f39b6b",
"icons/Icon-192.png": "606285e22cb23d3365cfc2b31a04f06f",
"icons/Icon-maskable-192.png": "606285e22cb23d3365cfc2b31a04f06f",
"icons/Icon-maskable-512.png": "1ba4558da1aad93090960ea0ec8f08a9",
"icons/Icon-512.png": "1ba4558da1aad93090960ea0ec8f08a9",
"manifest.json": "db40d283b0a25024d3e1583cb5cbde3d",
"assets/AssetManifest.json": "7dad9eeb5fc694889627e4eed5ff158c",
"assets/NOTICES": "7cf5a1341c5bbd6ea35d976215cc453e",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "3d807c4e93271c33a5953b480aee1677",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "bd3eaa1feba56f50486a13a107cf6407",
"assets/fonts/MaterialIcons-Regular.otf": "288b389f1001c6b49d30551e20117d87",
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
"assets/assets/doctor_ia_4.png": "bbdc5a82df155493aeb07417c4b1d5e5",
"assets/assets/doctor_ia_1.jpg": "f0c4f9bae7a15a40d5e1f1cbaabc6295",
"assets/assets/doctor_ia_2.png": "aa2479998fd3247f89562a79ffa6f5b2",
"assets/assets/doctor_ia_3.png": "1867e7c73391285dc4908f361cdad781",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
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
