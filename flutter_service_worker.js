'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "6a63d4244b37a6a92bd951479a4934aa",
"assets/AssetManifest.bin.json": "6fc3d98649d9b7fdfe1133693a1fc2af",
"assets/AssetManifest.json": "eee4eaa695c652415aa7272d8d06d838",
"assets/assets/audio/MP3/An-On.mp3": "fecb72332638be9aecfe1323e78cf9a6",
"assets/assets/audio/MP3/Buy.mp3": "125b5052e872303c6f5fe46c5447e7ab",
"assets/assets/audio/MP3/Ekitaade.mp3": "fe28aa30fe04ff48ab254bc75bad6e29",
"assets/assets/audio/MP3/Faamaali.mp3": "f50be36c2156364132c9d780edfd47d3",
"assets/assets/audio/MP3/Lanni.mp3": "d1af941c863a1ac9f284a05f0bac10b0",
"assets/assets/audio/MP3/Lesson1/lesson1_phrase1.mp3": "633f60bbafb989a116bcf2c9931ae862",
"assets/assets/audio/MP3/Lesson1/lesson1_phrase2.mp3": "2497331458c59255a6a5390b01d93703",
"assets/assets/audio/MP3/Lesson1/lesson1_phrase3.mp3": "99a210dd1c4811735ab03e2029d08762",
"assets/assets/audio/MP3/Lesson1/lesson1_phrase4.mp3": "d95873cd2cadc20bd0c365c4fc73da36",
"assets/assets/audio/MP3/Lesson1/lesson1_phrase5.mp3": "794aff3ce3ac9191411715f6ecc3d696",
"assets/assets/audio/MP3/Mi-Lan.mp3": "40166bcdef6b412911ea10716f84638c",
"assets/assets/audio/MP3/Mi.mp3": "e88f7d247d0f22e4ed8bab53b62a3cc1",
"assets/assets/audio/MP3/Pular.mp3": "2993d4e91a3fa7b0b2d0f12a3b927ccf",
"assets/assets/audio/MP3/Seeda.mp3": "c67cc67d56306d508b99700b6c8d1920",
"assets/assets/audio/MP3/Tun.mp3": "e8b833cacb15dc4d6fb0340c39ecc7a5",
"assets/assets/audio/MP3/Waawataa.mp3": "5e82ffedadb219cd46cd78174c21f2c4",
"assets/assets/audio/MP3/Waawi.mp3": "be0bab37c5cc14eb9863a8c3734b5c47",
"assets/assets/images/lesson1_phrase1.jpg": "1573296dae56541095860a52f0fe9077",
"assets/assets/images/lesson1_phrase2.jpg": "18029ae6e5419e3a8b5a9b66197d5336",
"assets/assets/images/lesson1_phrase3.jpg": "36af34150a845e33f8410a65286fedac",
"assets/assets/images/lesson1_phrase4.jpg": "1c9690126ed17fd3c001ff7e6833bc33",
"assets/assets/images/lesson1_phrase5.jpg": "90fad364569da47da0c0e416b8d50384",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/fonts/MaterialIcons-Regular.otf": "c9b5f69ed6dcbc5e50b2bb3d14e55b3b",
"assets/NOTICES": "062ecd4290ac8bccf6a04ef123af60f2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "9aaacc2249fe8b1fd1ed70e9caf5ccfc",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "654b8e38bd5598ad70c524637a6c8f30",
"/": "654b8e38bd5598ad70c524637a6c8f30",
"main.dart.js": "e391632a99223bdacd50588ea77a27e9",
"manifest.json": "bf24c84c3bf99672a631c4f84464e793",
"version.json": "230dcb07859034002dcbb061daaba3b8"};
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
