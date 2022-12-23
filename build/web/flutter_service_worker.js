'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "version.json": "02494c22a0ae9600c211633063e8e577",
"index.html": "729f80dc5dc3b24a1dcfeb623521dcee",
"/": "729f80dc5dc3b24a1dcfeb623521dcee",
"main.dart.js": "7d7e121e4be5d2ef7ab38495fc698ec6",
"flutter.js": "f85e6fb278b0fd20c349186fb46ae36d",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "99251a16ed4f97fc3f6e2ef5000543a2",
"assets/images/numbers/8.png": "66f89b3b7ef5a3be5602631d13c2c599",
"assets/images/numbers/9.png": "f80b37faa45b7802329ea09445fbb5c6",
"assets/images/numbers/4.png": "39b55611bcc05010185662106e35b398",
"assets/images/numbers/5.png": "17037c4baf5ead308af56996015e8ccb",
"assets/images/numbers/7.png": "780a6bc7f4a28baa0be276c707e2f232",
"assets/images/numbers/6.png": "ff0b28afe44df1eaf15f0f8edafd394d",
"assets/images/numbers/2.png": "7884e1a638264af5c8ce89491729f420",
"assets/images/numbers/3.png": "f30b8e9fdda72b9aea7bde379f08da25",
"assets/images/numbers/1.png": "55105de8e5afbf07539f163ed9b6d725",
"assets/images/numbers/%25C2%25B0.png": "f1701b410246f86a3c96cecdec98f20b",
"assets/images/numbers/0.png": "d4b08b5a2c9cec6fa17a46ead3b39864",
"assets/AssetManifest.json": "8dc698ba041e8f0c8fe5471e4eb8e5b7",
"assets/NOTICES": "e9c500de335d1561b22f151063b5d791",
"assets/FontManifest.json": "b78161b5f25f43243be406deb5a292ab",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/shaders/ink_sparkle.frag": "00901b68ca2720c6749c0c385916478d",
"assets/fonts/AvenirNextCondensed-HeavyItalic.ttf": "6ffdf4d5110d338ded3a8c5981be0c9d",
"assets/fonts/AvenirNextCondensedBoldItalic.ttf": "c52394303d0527bf1d43864226bc53c7",
"assets/fonts/AvenirNextCondensed-Regular.ttf": "3f326f52e09cd51b035f0f082596ef56",
"assets/fonts/AvenirNextCondensedBold.ttf": "32e491acfed225d10c9b52da6c427400",
"assets/fonts/AvenirNext-BoldItalic.ttf": "515d7e885898d36fd1fc915b6bc082fd",
"assets/fonts/AvenirNext-UltraLightItalic.ttf": "30a38938ab7fd34481fec5a36b8adde5",
"assets/fonts/AvenirNextDemiBoldItalic.ttf": "51f2b53907454d84d8d5b606a562f2b4",
"assets/fonts/AvenirNextCondensed-MediumItalic.ttf": "5565711035792e356226f8c3e4bfbb50",
"assets/fonts/AvenirNext-MediumItalic.ttf": "e5b8192083f701014ce05991ff1d31b0",
"assets/fonts/AvenirNextCondensed-UltraLightItalic.ttf": "b4533c2a8e9ab089a720545be6bbb7f4",
"assets/fonts/AvenirNextCondensed-Medium.ttf": "2f12e988bc1f2e0190c9c9a7801ef66f",
"assets/fonts/AvenirNextCondensed-Heavy.ttf": "89a2f92516f253b6316bca8c0bd586f3",
"assets/fonts/AvenirNext-Italic.ttf": "d60e465efdd132e5b9946b42ce62e0a3",
"assets/fonts/AvenirNextCondensedDemiBoldItalic.ttf": "eeeb6bce27530711fba46d4b161b0c03",
"assets/fonts/AvenirNextDemiBold.ttf": "acf8e50af34c84cefd75f948d396ef2e",
"assets/fonts/AvenirNext-UltraLight.ttf": "5a3ae3df50d4fb0ad54f01a29f429efe",
"assets/fonts/AvenirNextCondensed-Italic.ttf": "7a9524e2ce167f4855e890a633ac1a6f",
"assets/fonts/AvenirNext-Regular.ttf": "1f1c6c5055bfc41663d1d1adf4b29604",
"assets/fonts/AvenirNext-Heavy.ttf": "85c05d10b3053bdd5f020fb145c92694",
"assets/fonts/AvenirNext-Medium.ttf": "3885c0cebfbc3e55fbe30ad45a165586",
"assets/fonts/AvenirNext-Bold.ttf": "88da9ccecc9a384876ccf7c53eccec2d",
"assets/fonts/AvenirNextCondensed-UltraLight.ttf": "0f21db472aff41076cc06b9421dc9a4d",
"assets/fonts/MaterialIcons-Regular.otf": "95db9098c58fd6db106f1116bae85a0b",
"assets/fonts/AvenirNext-HeavyItalic.ttf": "4b2d35bd156ac8df682f3d104eb487d1",
"assets/fonts/AvenirNextCondensedDemiBold.ttf": "90635fc662fe8685a7146a5c0e40e22a",
"canvaskit/canvaskit.js": "2bc454a691c631b07a9307ac4ca47797",
"canvaskit/profiling/canvaskit.js": "38164e5a72bdad0faa4ce740c9b8e564",
"canvaskit/profiling/canvaskit.wasm": "95a45378b69e77af5ed2bc72b2209b94",
"canvaskit/canvaskit.wasm": "bf50631470eb967688cca13ee181af62"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
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
