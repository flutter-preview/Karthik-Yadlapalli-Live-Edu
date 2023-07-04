'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/NOTICES": "d753c5f6bbf875e49ef4ab05d8c789dd",
"assets/asstes/illustrations/svgviewer-output%2520(1)%2520copy.png": "8c4b688f686934bd080a3c8ca00262ce",
"assets/asstes/illustrations/svgviewer-output%2520(3).png": "19eac86c78d73f828dec15b38faefc62",
"assets/asstes/illustrations/svgviewer-output%2520(8).png": "7cc13e4018e20ee8ff76730ee660f1de",
"assets/asstes/illustrations/svgviewer-output%2520(11).png": "3944ca0e644fbdee622a56131ce0272a",
"assets/asstes/illustrations/svgviewer-output%2520(6).png": "a6967894a579d0e927e5d74f892699be",
"assets/asstes/illustrations/svgviewer-output.png": "fc4aef39377faf8dba22442671074d5c",
"assets/asstes/illustrations/svgviewer-output%2520(14).png": "9a6e61c4e32c8f6f6c650e3fc5116c96",
"assets/asstes/illustrations/svgviewer-output%2520(12).png": "60dcaa47b1a406197cfd6d1708ad5eed",
"assets/asstes/illustrations/svgviewer-output%2520(13).png": "2d2a945c4f75e14cea7a87f822873cb4",
"assets/asstes/illustrations/svgviewer-output%2520(1).png": "86cf53b5c5bd1f7a9af0d50ba3ee567e",
"assets/asstes/illustrations/svgviewer-output%2520(10).png": "b05dec66525aff9dcdab6672096bfd49",
"assets/asstes/illustrations/svgviewer-output%2520(5).png": "a0cd030640452da14355689e75f4172c",
"assets/asstes/illustrations/svgviewer-output%2520(2).png": "a4f199a9a8067803f96405fbe3722b93",
"assets/asstes/illustrations/svgviewer-output%2520(9).png": "1c46cf489e2b697737ca12d656314c1d",
"assets/asstes/illustrations/svgviewer-output%2520copy.png": "3c84e6a40792679ed2d0667921f8f5ed",
"assets/asstes/illustrations/svgviewer-output%2520(4).png": "33916e2d680030a4b6fdf578e6b4ff33",
"assets/asstes/illustrations/splash.png": "8e2002fc82ef296aa0675bcdc6aee29e",
"assets/asstes/illustrations/svgviewer-output%2520(15).png": "b8b9e48b8d24e196277b6ede58fa2712",
"assets/asstes/illustrations/svgviewer-output%2520(7).png": "f057411c709264a8cdbdf453950969ed",
"assets/asstes/fonts/EduIcons.ttf": "11c83914def7f87873c2305279855082",
"assets/AssetManifest.json": "603c71443f157ad78fcdebe06decf341",
"assets/FontManifest.json": "4896986a6e0a030e5652b6d6da3cacfc",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"index.html": "df273b4b83adea0bbc09324cc72b41f4",
"/": "df273b4b83adea0bbc09324cc72b41f4",
"main.dart.js": "b7a43e6fc66d9a9df160d56a0805b06b",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"version.json": "3ffedc4eff95c2ff75b094726dd1d662",
"manifest.json": "8de06da6d7d543decc39b74278aa9a85",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796"
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
