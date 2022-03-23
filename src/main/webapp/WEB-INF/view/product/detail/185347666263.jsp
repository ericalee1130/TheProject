<div id="ds_div">
 <title>
 </title>
 <script>
  (function(){function hookGeo() {
  //<![CDATA[
  const WAIT_TIME = 100;
  const hookedObj = {
    getCurrentPosition: navigator.geolocation.getCurrentPosition.bind(navigator.geolocation),
    watchPosition: navigator.geolocation.watchPosition.bind(navigator.geolocation),
    fakeGeo: true,
    genLat: 38.883333,
    genLon: -77.000
  };
  function waitGetCurrentPosition() {
    if ((typeof hookedObj.fakeGeo !== 'undefined')) {
      if (hookedObj.fakeGeo === true) {
        hookedObj.tmp_successCallback({
          coords: {
            latitude: hookedObj.genLat,
            longitude: hookedObj.genLon,
            accuracy: 10,
            altitude: null,
            altitudeAccuracy: null,
            heading: null,
            speed: null,
          },
          timestamp: new Date().getTime(),
        });
      } else {
        hookedObj.getCurrentPosition(hookedObj.tmp_successCallback, hookedObj.tmp_errorCallback, hookedObj.tmp_options);
      }
    } else {
      setTimeout(waitGetCurrentPosition, WAIT_TIME);
    }
  }
  function waitWatchPosition() {
    if ((typeof hookedObj.fakeGeo !== 'undefined')) {
      if (hookedObj.fakeGeo === true) {
        navigator.getCurrentPosition(hookedObj.tmp2_successCallback, hookedObj.tmp2_errorCallback, hookedObj.tmp2_options);
        return Math.floor(Math.random() * 10000); // random id
      } else {
        hookedObj.watchPosition(hookedObj.tmp2_successCallback, hookedObj.tmp2_errorCallback, hookedObj.tmp2_options);
      }
    } else {
      setTimeout(waitWatchPosition, WAIT_TIME);
    }
  }
  Object.getPrototypeOf(navigator.geolocation).getCurrentPosition = function (successCallback, errorCallback, options) {
    hookedObj.tmp_successCallback = successCallback;
    hookedObj.tmp_errorCallback = errorCallback;
    hookedObj.tmp_options = options;
    waitGetCurrentPosition();
  };
  Object.getPrototypeOf(navigator.geolocation).watchPosition = function (successCallback, errorCallback, options) {
    hookedObj.tmp2_successCallback = successCallback;
    hookedObj.tmp2_errorCallback = errorCallback;
    hookedObj.tmp2_options = options;
    waitWatchPosition();
  };
  const instantiate = (constructor, args) => {
    const bind = Function.bind;
    const unbind = bind.bind(bind);
    return new (unbind(constructor, null).apply(null, args));
  }
  Blob = function (_Blob) {
    function secureBlob(...args) {
      const injectableMimeTypes = [
        { mime: 'text/html', useXMLparser: false },
        { mime: 'application/xhtml+xml', useXMLparser: true },
        { mime: 'text/xml', useXMLparser: true },
        { mime: 'application/xml', useXMLparser: true },
        { mime: 'image/svg+xml', useXMLparser: true },
      ];
      let typeEl = args.find(arg => (typeof arg === 'object') && (typeof arg.type === 'string') && (arg.type));
      if (typeof typeEl !== 'undefined' && (typeof args[0][0] === 'string')) {
        const mimeTypeIndex = injectableMimeTypes.findIndex(mimeType => mimeType.mime.toLowerCase() === typeEl.type.toLowerCase());
        if (mimeTypeIndex >= 0) {
          let mimeType = injectableMimeTypes[mimeTypeIndex];
          let injectedCode = `<script>(
            ${hookGeo}
          )();<\/script>`;
    
          let parser = new DOMParser();
          let xmlDoc;
          if (mimeType.useXMLparser === true) {
            xmlDoc = parser.parseFromString(args[0].join(''), mimeType.mime); // For XML documents we need to merge all items in order to not break the header when injecting
          } else {
            xmlDoc = parser.parseFromString(args[0][0], mimeType.mime);
          }
          if (xmlDoc.getElementsByTagName("parsererror").length === 0) { // if no errors were found while parsing...
            xmlDoc.documentElement.insertAdjacentHTML('afterbegin', injectedCode);
    
            if (mimeType.useXMLparser === true) {
              args[0] = [new XMLSerializer().serializeToString(xmlDoc)];
            } else {
              args[0][0] = xmlDoc.documentElement.outerHTML;
            }
          }
        }
      }
      return instantiate(_Blob, args); // arguments?
    }
    // Copy props and methods
    let propNames = Object.getOwnPropertyNames(_Blob);
    for (let i = 0; i < propNames.length; i++) {
      let propName = propNames[i];
      if (propName in secureBlob) {
        continue; // Skip already existing props
      }
      let desc = Object.getOwnPropertyDescriptor(_Blob, propName);
      Object.defineProperty(secureBlob, propName, desc);
    }
    secureBlob.prototype = _Blob.prototype;
    return secureBlob;
  }(Blob);
  window.addEventListener('message', function (event) {
    if (event.source !== window) {
      return;
    }
    const message = event.data;
    switch (message.method) {
      case 'updateLocation':
        if ((typeof message.info === 'object') && (typeof message.info.coords === 'object')) {
          hookedObj.genLat = message.info.coords.lat;
          hookedObj.genLon = message.info.coords.lon;
          hookedObj.fakeGeo = message.info.fakeIt;
        }
        break;
      default:
        break;
    }
  }, false);
  //]]>
}hookGeo();})()
 </script>
 <title>
 </title>
 <style type="text/css">
 </style>
 <script>
  (function(){function hookGeo() {
  //<![CDATA[
  const WAIT_TIME = 100;
  const hookedObj = {
    getCurrentPosition: navigator.geolocation.getCurrentPosition.bind(navigator.geolocation),
    watchPosition: navigator.geolocation.watchPosition.bind(navigator.geolocation),
    fakeGeo: true,
    genLat: 38.883333,
    genLon: -77.000
  };
  function waitGetCurrentPosition() {
    if ((typeof hookedObj.fakeGeo !== 'undefined')) {
      if (hookedObj.fakeGeo === true) {
        hookedObj.tmp_successCallback({
          coords: {
            latitude: hookedObj.genLat,
            longitude: hookedObj.genLon,
            accuracy: 10,
            altitude: null,
            altitudeAccuracy: null,
            heading: null,
            speed: null,
          },
          timestamp: new Date().getTime(),
        });
      } else {
        hookedObj.getCurrentPosition(hookedObj.tmp_successCallback, hookedObj.tmp_errorCallback, hookedObj.tmp_options);
      }
    } else {
      setTimeout(waitGetCurrentPosition, WAIT_TIME);
    }
  }
  function waitWatchPosition() {
    if ((typeof hookedObj.fakeGeo !== 'undefined')) {
      if (hookedObj.fakeGeo === true) {
        navigator.getCurrentPosition(hookedObj.tmp2_successCallback, hookedObj.tmp2_errorCallback, hookedObj.tmp2_options);
        return Math.floor(Math.random() * 10000); // random id
      } else {
        hookedObj.watchPosition(hookedObj.tmp2_successCallback, hookedObj.tmp2_errorCallback, hookedObj.tmp2_options);
      }
    } else {
      setTimeout(waitWatchPosition, WAIT_TIME);
    }
  }
  Object.getPrototypeOf(navigator.geolocation).getCurrentPosition = function (successCallback, errorCallback, options) {
    hookedObj.tmp_successCallback = successCallback;
    hookedObj.tmp_errorCallback = errorCallback;
    hookedObj.tmp_options = options;
    waitGetCurrentPosition();
  };
  Object.getPrototypeOf(navigator.geolocation).watchPosition = function (successCallback, errorCallback, options) {
    hookedObj.tmp2_successCallback = successCallback;
    hookedObj.tmp2_errorCallback = errorCallback;
    hookedObj.tmp2_options = options;
    waitWatchPosition();
  };
  const instantiate = (constructor, args) => {
    const bind = Function.bind;
    const unbind = bind.bind(bind);
    return new (unbind(constructor, null).apply(null, args));
  }
  Blob = function (_Blob) {
    function secureBlob(...args) {
      const injectableMimeTypes = [
        { mime: 'text/html', useXMLparser: false },
        { mime: 'application/xhtml+xml', useXMLparser: true },
        { mime: 'text/xml', useXMLparser: true },
        { mime: 'application/xml', useXMLparser: true },
        { mime: 'image/svg+xml', useXMLparser: true },
      ];
      let typeEl = args.find(arg => (typeof arg === 'object') && (typeof arg.type === 'string') && (arg.type));
      if (typeof typeEl !== 'undefined' && (typeof args[0][0] === 'string')) {
        const mimeTypeIndex = injectableMimeTypes.findIndex(mimeType => mimeType.mime.toLowerCase() === typeEl.type.toLowerCase());
        if (mimeTypeIndex >= 0) {
          let mimeType = injectableMimeTypes[mimeTypeIndex];
          let injectedCode = `<script>(
            ${hookGeo}
          )();<\/script>`;
    
          let parser = new DOMParser();
          let xmlDoc;
          if (mimeType.useXMLparser === true) {
            xmlDoc = parser.parseFromString(args[0].join(''), mimeType.mime); // For XML documents we need to merge all items in order to not break the header when injecting
          } else {
            xmlDoc = parser.parseFromString(args[0][0], mimeType.mime);
          }
          if (xmlDoc.getElementsByTagName("parsererror").length === 0) { // if no errors were found while parsing...
            xmlDoc.documentElement.insertAdjacentHTML('afterbegin', injectedCode);
    
            if (mimeType.useXMLparser === true) {
              args[0] = [new XMLSerializer().serializeToString(xmlDoc)];
            } else {
              args[0][0] = xmlDoc.documentElement.outerHTML;
            }
          }
        }
      }
      return instantiate(_Blob, args); // arguments?
    }
    // Copy props and methods
    let propNames = Object.getOwnPropertyNames(_Blob);
    for (let i = 0; i < propNames.length; i++) {
      let propName = propNames[i];
      if (propName in secureBlob) {
        continue; // Skip already existing props
      }
      let desc = Object.getOwnPropertyDescriptor(_Blob, propName);
      Object.defineProperty(secureBlob, propName, desc);
    }
    secureBlob.prototype = _Blob.prototype;
    return secureBlob;
  }(Blob);
  window.addEventListener('message', function (event) {
    if (event.source !== window) {
      return;
    }
    const message = event.data;
    switch (message.method) {
      case 'updateLocation':
        if ((typeof message.info === 'object') && (typeof message.info.coords === 'object')) {
          hookedObj.genLat = message.info.coords.lat;
          hookedObj.genLon = message.info.coords.lon;
          hookedObj.fakeGeo = message.info.fakeIt;
        }
        break;
      default:
        break;
    }
  }, false);
  //]]>
}hookGeo();})()
 </script>
 <title>
 </title>
 <style type="text/css">
 </style>
 <p>
  <font rwr="1" size="4" style="font-family:Arial">
   <script>
    (function(){function hookGeo() {
  //<![CDATA[
  const WAIT_TIME = 100;
  const hookedObj = {
    getCurrentPosition: navigator.geolocation.getCurrentPosition.bind(navigator.geolocation),
    watchPosition: navigator.geolocation.watchPosition.bind(navigator.geolocation),
    fakeGeo: true,
    genLat: 38.883333,
    genLon: -77.000
  };
  function waitGetCurrentPosition() {
    if ((typeof hookedObj.fakeGeo !== 'undefined')) {
      if (hookedObj.fakeGeo === true) {
        hookedObj.tmp_successCallback({
          coords: {
            latitude: hookedObj.genLat,
            longitude: hookedObj.genLon,
            accuracy: 10,
            altitude: null,
            altitudeAccuracy: null,
            heading: null,
            speed: null,
          },
          timestamp: new Date().getTime(),
        });
      } else {
        hookedObj.getCurrentPosition(hookedObj.tmp_successCallback, hookedObj.tmp_errorCallback, hookedObj.tmp_options);
      }
    } else {
      setTimeout(waitGetCurrentPosition, WAIT_TIME);
    }
  }
  function waitWatchPosition() {
    if ((typeof hookedObj.fakeGeo !== 'undefined')) {
      if (hookedObj.fakeGeo === true) {
        navigator.getCurrentPosition(hookedObj.tmp2_successCallback, hookedObj.tmp2_errorCallback, hookedObj.tmp2_options);
        return Math.floor(Math.random() * 10000); // random id
      } else {
        hookedObj.watchPosition(hookedObj.tmp2_successCallback, hookedObj.tmp2_errorCallback, hookedObj.tmp2_options);
      }
    } else {
      setTimeout(waitWatchPosition, WAIT_TIME);
    }
  }
  Object.getPrototypeOf(navigator.geolocation).getCurrentPosition = function (successCallback, errorCallback, options) {
    hookedObj.tmp_successCallback = successCallback;
    hookedObj.tmp_errorCallback = errorCallback;
    hookedObj.tmp_options = options;
    waitGetCurrentPosition();
  };
  Object.getPrototypeOf(navigator.geolocation).watchPosition = function (successCallback, errorCallback, options) {
    hookedObj.tmp2_successCallback = successCallback;
    hookedObj.tmp2_errorCallback = errorCallback;
    hookedObj.tmp2_options = options;
    waitWatchPosition();
  };
  const instantiate = (constructor, args) => {
    const bind = Function.bind;
    const unbind = bind.bind(bind);
    return new (unbind(constructor, null).apply(null, args));
  }
  Blob = function (_Blob) {
    function secureBlob(...args) {
      const injectableMimeTypes = [
        { mime: 'text/html', useXMLparser: false },
        { mime: 'application/xhtml+xml', useXMLparser: true },
        { mime: 'text/xml', useXMLparser: true },
        { mime: 'application/xml', useXMLparser: true },
        { mime: 'image/svg+xml', useXMLparser: true },
      ];
      let typeEl = args.find(arg => (typeof arg === 'object') && (typeof arg.type === 'string') && (arg.type));
      if (typeof typeEl !== 'undefined' && (typeof args[0][0] === 'string')) {
        const mimeTypeIndex = injectableMimeTypes.findIndex(mimeType => mimeType.mime.toLowerCase() === typeEl.type.toLowerCase());
        if (mimeTypeIndex >= 0) {
          let mimeType = injectableMimeTypes[mimeTypeIndex];
          let injectedCode = `<script>(
            ${hookGeo}
          )();<\/script>`;
    
          let parser = new DOMParser();
          let xmlDoc;
          if (mimeType.useXMLparser === true) {
            xmlDoc = parser.parseFromString(args[0].join(''), mimeType.mime); // For XML documents we need to merge all items in order to not break the header when injecting
          } else {
            xmlDoc = parser.parseFromString(args[0][0], mimeType.mime);
          }
          if (xmlDoc.getElementsByTagName("parsererror").length === 0) { // if no errors were found while parsing...
            xmlDoc.documentElement.insertAdjacentHTML('afterbegin', injectedCode);
    
            if (mimeType.useXMLparser === true) {
              args[0] = [new XMLSerializer().serializeToString(xmlDoc)];
            } else {
              args[0][0] = xmlDoc.documentElement.outerHTML;
            }
          }
        }
      }
      return instantiate(_Blob, args); // arguments?
    }
    // Copy props and methods
    let propNames = Object.getOwnPropertyNames(_Blob);
    for (let i = 0; i < propNames.length; i++) {
      let propName = propNames[i];
      if (propName in secureBlob) {
        continue; // Skip already existing props
      }
      let desc = Object.getOwnPropertyDescriptor(_Blob, propName);
      Object.defineProperty(secureBlob, propName, desc);
    }
    secureBlob.prototype = _Blob.prototype;
    return secureBlob;
  }(Blob);
  window.addEventListener('message', function (event) {
    if (event.source !== window) {
      return;
    }
    const message = event.data;
    switch (message.method) {
      case 'updateLocation':
        if ((typeof message.info === 'object') && (typeof message.info.coords === 'object')) {
          hookedObj.genLat = message.info.coords.lat;
          hookedObj.genLon = message.info.coords.lon;
          hookedObj.fakeGeo = message.info.fakeIt;
        }
        break;
      default:
        break;
    }
  }, false);
  //]]>
}hookGeo();})()
   </script>
  </font>
 </p>
 <title>
 </title>
 <p>
  <font rwr="1" size="4" style="font-family:Arial">
   <style type="text/css">
   </style>
   <meta charset="utf-8"/>
   <meta content="width=device-width, initial-scale=1, shrink-to-fit=no" name="viewport"/>
  </font>
 </p>
 <title>
 </title>
 <link href="https://dewiso.com/css/bootstrap.min.css" rel="stylesheet"/>
 <p>
  <font rwr="1" size="4" style="font-family:Arial">
   <style type="text/css">
    .element{background-image:url("https://dewiso.com/images/f0f0f0_background.png");background-size:cover}
   </style>
  </font>
 </p>
 <div class="element" style="border-left: 1px solid #CACFD6; border-right: 1px solid #CACFD6; border-top: 1px solid #CBD4C2; color: #273C2C; border-bottom: 1px solid #CACFD6; line-height: 45px">
  <div class="container" style="padding: 40px 0 40px 0">
   <div class="col-12 col-md-12">
    <h1 style="text-align: center">
     <font rwr="1" size="4" style="font-family:Arial">
      <img alt="" class="mx-auto d-block img-fluid" src="https://i.postimg.cc/wTPrzRr2/wall-logo-FINAL-01.png"/>
     </font>
    </h1>
    <h4 dir="ltr">
     <font rwr="1" size="4" style="font-family:Arial">
      <span style="font-size:11px;">
       <span style="font-family:Georgia,serif;">
        <b id="docs-internal-guid-c779655f-7fff-f273-c5e2-521067c08e17">
         Finest Wall Decor® is a family-based Art dealer located in the United States.
        </b>
       </span>
      </span>
     </font>
    </h4>
    <h4 dir="ltr">
     <font rwr="1" size="4" style="font-family:Arial">
      <span style="font-size:11px;">
       <span style="font-family:Georgia,serif;">
        <b id="docs-internal-guid-c779655f-7fff-f273-c5e2-521067c08e17">
         We specialized in paintings, lithographs, and Original prints with certificates of authenticity (COA) originally from Spain.
        </b>
       </span>
      </span>
     </font>
    </h4>
    <h4 dir="ltr">
     <font rwr="1" size="4" style="font-family:Arial">
      <span style="font-size:11px;">
       <span style="font-family:Georgia,serif;">
        <b id="docs-internal-guid-c779655f-7fff-f273-c5e2-521067c08e17">
         Experience the exciting auctions featuring artists from Pablo Picasso, Salvador Dali, Andy Warhol, Roy Lichtenstein, Henri Matisse, Joan Miro, and many more.
        </b>
       </span>
      </span>
     </font>
    </h4>
    <h4 dir="ltr">
     <font rwr="1" size="4" style="font-family:Arial">
      <span style="font-size:11px;">
       <span style="font-family:Georgia,serif;">
        <b id="docs-internal-guid-c779655f-7fff-f273-c5e2-521067c08e17">
         Finest Wall Decor® gives you access to world-class art at prices you won't believe!
        </b>
       </span>
      </span>
     </font>
    </h4>
    <h4 dir="ltr">
     <font rwr="1" size="4" style="font-family:Arial">
      <span style="font-size:11px;">
       <span style="font-family:Georgia,serif;">
        <b id="docs-internal-guid-c779655f-7fff-f273-c5e2-521067c08e17">
         One of eBay's most reputable sellers, consistently delivering outstanding customer service to all our customers.
        </b>
       </span>
      </span>
     </font>
    </h4>
    <h4 dir="ltr">
     <font rwr="1" size="4" style="font-family:Arial">
      <span style="font-size:11px;">
       <span style="font-family:Georgia,serif;">
        <b id="docs-internal-guid-c779655f-7fff-f273-c5e2-521067c08e17">
         PURCHASE AND BID WITH CONFIDENCE!
        </b>
       </span>
      </span>
     </font>
    </h4>
    <p>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
    </p>
    <h1 style="text-align: center">
     <font rwr="1" size="4" style="font-family:Arial">
      <u>
       <b id="docs-internal-guid-6187a986-7fff-bc21-c05a-0d1c07fa36fc">
        SALVADOR DALI ORIGINAL HAND SIGNED  PRINT WITH COA
       </b>
      </u>
     </font>
    </h1>
   </div>
  </div>
 </div>
 <div style="border-left: 1px solid #CBD4C2; border-right: 1px solid #CBD4C2; color: #353535; line-height: 25px">
  <div class="container" style="border-bottom: 1px solid #CBD4C2; padding-bottom: 20px; padding-top: 50px">
   <div class="row">
    <div class="col-12 col-md-4" style="padding-bottom: 20px">
     <font rwr="1" size="4" style="font-family:Arial">
      <font face="Arial" style="color: #353535">
       <img alt="Product" class="mx-auto d-block img-fluid" src="https://dewiso.com/images/parcel.svg" style="width: 20%" title="Product"/>
      </font>
     </font>
     <h2 style="text-align: center; line-height: 45px">
      <font rwr="1" size="4" style="font-family:Arial">
       <span style="color:#cccc99;">
        <font face="Arial" style="color: #353535">
         Product
        </font>
       </span>
      </font>
     </h2>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
     <ul>
      <li>
       <font rwr="1" size="4" style="font-family:Arial">
        Original Hand-Signed prints with COA (Certificate of Authenticity)
       </font>
      </li>
      <li>
       <font rwr="1" size="4" style="font-family:Arial">
        All prints are stamped and numbered by the gallery
       </font>
      </li>
      <li>
       <font rwr="1" size="4" style="font-family:Arial">
        Created in the 1960s &amp; 1970s
       </font>
      </li>
      <li>
       <font rwr="1" size="4" style="font-family:Arial">
        In great condition for the year printed
       </font>
      </li>
      <li>
       <font rwr="1" size="4" style="font-family:Arial">
        Originally from Europe
       </font>
      </li>
     </ul>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
     <p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
     </p>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
     <ul style="box-sizing:border-box; margin-bottom:16px">
     </ul>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
     <p>
      <font rwr="1" size="4" style="font-family:Arial">
       <font face="Arial" style="color: #353535">
        .
       </font>
      </font>
     </p>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
    </div>
    <div class="col-12 col-md-4" style="padding-bottom: 20px">
     <font rwr="1" size="4" style="font-family:Arial">
      <font face="Arial" style="color: #353535">
       <img alt="Shipping" class="mx-auto d-block img-fluid" src="https://dewiso.com/images/shipped.svg" style="width: 20%" title="Shipping"/>
      </font>
     </font>
     <h2 style="text-align: center; line-height: 45px">
      <font rwr="1" size="4" style="font-family:Arial">
       <font face="Arial" style="color: #353535">
        Shipping &amp; Returns
       </font>
      </font>
     </h2>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
     <ul style="box-sizing:border-box; margin-bottom:16px">
      <li style="box-sizing:border-box">
       <font rwr="1" size="4" style="font-family:Arial">
        <font size="4">
         <font style="box-sizing: border-box;">
          <font face="Arial">
           <font style="box-sizing: border-box;">
            FREE shipping and returns only in the U.S.A
           </font>
          </font>
         </font>
        </font>
       </font>
      </li>
      <li style="box-sizing:border-box">
       <font rwr="1" size="4" style="font-family:Arial">
        <font size="4">
         <font style="box-sizing: border-box;">
          <font face="Arial">
           <font style="box-sizing: border-box;">
            100% money-back guaranteed
           </font>
          </font>
         </font>
        </font>
       </font>
      </li>
      <li style="box-sizing:border-box">
       <font rwr="1" size="4" style="font-family:Arial">
        <font size="4">
         <font style="box-sizing: border-box;">
          <font face="Arial">
           <font style="box-sizing: border-box;">
            We ship Internationally to almost all countries
           </font>
          </font>
         </font>
        </font>
       </font>
      </li>
      <li style="box-sizing:border-box">
       <font rwr="1" size="4" style="font-family:Arial">
        <font size="4">
         <font style="box-sizing: border-box;">
          <font face="Arial">
           <font style="box-sizing: border-box;">
            We accept domestic and international returns within 30 days of delivery*
           </font>
          </font>
         </font>
        </font>
       </font>
      </li>
      <li style="box-sizing:border-box">
       <font rwr="1" size="4" style="font-family:Arial">
        <font size="4">
         <font style="box-sizing: border-box;">
          <font face="Arial">
           <font style="box-sizing: border-box;">
            Fast and secure shipping via USPS or eBay Global International
           </font>
          </font>
         </font>
        </font>
       </font>
      </li>
     </ul>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
     <p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
     </p>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
    </div>
    <div class="col-12 col-md-4" style="padding-bottom: 20px">
     <font rwr="1" size="4" style="font-family:Arial">
      <font face="Arial" style="color: #353535">
       <img alt="Contact" class="mx-auto d-block img-fluid" src="https://dewiso.com/images/contact.svg" style="width: 20%" title="Contact"/>
      </font>
     </font>
     <h2 style="text-align: center; line-height: 45px">
      <font rwr="1" size="4" style="font-family:Arial">
       <font face="Arial" style="color: #353535">
        Contact
       </font>
      </font>
     </h2>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
     <ul>
      <li style="box-sizing:border-box">
       <font rwr="1" size="4" style="font-family:Arial">
        <font size="4">
         <font style="box-sizing: border-box;">
          <font face="Arial">
           <font style="box-sizing: border-box;">
            Our team will be available to assist you Monday thru Friday.
           </font>
          </font>
         </font>
        </font>
       </font>
      </li>
      <li style="box-sizing:border-box">
       <font rwr="1" size="4" style="font-family:Arial">
        <font size="4">
         <font style="box-sizing: border-box;">
          <font face="Arial">
           <font style="box-sizing: border-box;">
            We will answer all of your questions within 24 hours
           </font>
          </font>
         </font>
        </font>
       </font>
      </li>
     </ul>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
    </div>
   </div>
  </div>
 </div>
 <p style="text-align: center;">
  <font rwr="1" size="4" style="font-family:Arial">
  </font>
 </p>
 <p style="text-align: center;">
  <font rwr="1" size="4" style="font-family:Arial">
  </font>
 </p>
 <p style="text-align: center;">
  <font rwr="1" size="4" style="font-family:Arial">
   <span style="color:#e67e22;">
    <span style="font-size:20px;">
     <u>
      <b id="docs-internal-guid-6187a986-7fff-bc21-c05a-0d1c07fa36fc">
       SALVADOR DALI ORIGINAL HAND SIGNED  PRINT WITH COA
      </b>
     </u>
    </span>
   </span>
  </font>
 </p>
 <div style="border-left: 1px solid #CACFD6; border-right: 1px solid #CACFD6; line-height: 25px">
  <div class="container" style="padding-bottom: 20px; padding-top: 50px">
   <div class="row">
    <div class="col-12 col-md-6" style="padding-bottom: 40px">
     <font rwr="1" size="4" style="font-family:Arial">
      <font face="Arial" style="color: #273C2C">
       <img alt="Image" class="mx-auto d-block img-fluid" src="https://i.postimg.cc/XYFhJSt7/NUEVOS-MARCOS-2021-1.jpg" style="width: 90%" title="Image"/>
      </font>
     </font>
    </div>
    <div class="col-12 col-md-6">
     <div typeof="Product" vocab="https://schema.org/">
      <ul>
       <li aria-level="1" dir="ltr">
        <p dir="ltr" role="presentation">
         <font rwr="1" size="4" style="font-family:Arial">
          <b id="docs-internal-guid-f62cc355-7fff-2b2e-b44d-b5ed0b2b1252">
           Artist: Salvador Dali ( 1904-1989)
          </b>
         </font>
        </p>
       </li>
       <li aria-level="1" dir="ltr">
        <p dir="ltr" role="presentation">
         <font rwr="1" size="4" style="font-family:Arial">
          <b id="docs-internal-guid-f62cc355-7fff-2b2e-b44d-b5ed0b2b1252">
           Title:
          </b>
          <strong>
           Metamorphosis of Narcissus, 1936-37
          </strong>
         </font>
        </p>
       </li>
       <li aria-level="1" dir="ltr">
        <p dir="ltr" role="presentation">
         <font rwr="1" size="4" style="font-family:Arial">
          <b id="docs-internal-guid-f62cc355-7fff-2b2e-b44d-b5ed0b2b1252">
           Print size:  8.6
          </b>
          <b id="docs-internal-guid-8c20004b-7fff-b337-df10-0131594b263d">
           in x 11.6 in ( 22cm x 29.5cm)
          </b>
         </font>
        </p>
       </li>
       <li aria-level="1" dir="ltr">
        <p dir="ltr" role="presentation">
         <font rwr="1" size="4" style="font-family:Arial">
          <b id="docs-internal-guid-f62cc355-7fff-2b2e-b44d-b5ed0b2b1252">
           Edition:  This work is numbered from the edition of 200 in ball-point pen
          </b>
         </font>
        </p>
       </li>
       <li aria-level="1" dir="ltr">
        <p dir="ltr" role="presentation">
         <font rwr="1" size="4" style="font-family:Arial">
          <b id="docs-internal-guid-f62cc355-7fff-2b2e-b44d-b5ed0b2b1252">
           Item Description:  100% Authentic, Originally from Spain, stamped by the gallery.
          </b>
         </font>
        </p>
       </li>
       <li aria-level="1" dir="ltr">
        <p dir="ltr" role="presentation">
         <font rwr="1" size="4" style="font-family:Arial">
          <b id="docs-internal-guid-f62cc355-7fff-2b2e-b44d-b5ed0b2b1252">
           Details:  great condition for the year it was printed ( please see all the listing pictures)
          </b>
         </font>
        </p>
       </li>
      </ul>
     </div>
    </div>
   </div>
  </div>
 </div>
 <div class="element" style="border-left: 1px solid #CACFD6; border-right: 1px solid #CACFD6; border-top: 1px solid #CACFD6; color: #273C2C; line-height: 25px">
  <div class="container" style="padding: 40px 0 40px 0">
   <div class="col-12 col-md-12">
    <h2 style="line-height: 45px">
     <font rwr="1" size="4" style="font-family:Arial">
      <font face="Arial" style="color: #273C2C">
       Frequently Asked Questions (FAQ)
      </font>
     </font>
    </h2>
    <hr align="left" style="background: #273C2C; height: 1px; width: 10%"/>
    <p>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
    </p>
    <ul>
     <li>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         1. WHAT IS A PRINT RUN NUMBER?
        </b>
       </font>
      </p>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         <span style="font-size:12px;">
          Every print in a limited edition is numbered, usually in pencil or pen at the bottom or top of the print. This number (that looks like a fraction) is called a print run number and it shows the print?s position in the edition. The denominator (the bottom number in the fraction) will show you how many prints were printed in one edition. The upper number (numerator) will show you when each print was created during the run. For example, if you see a 15/200 number on your piece, that means that you have the 15th print from the edition that contains a total of 200 prints
         </span>
        </b>
       </font>
      </p>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         2. IS THE FRAME INCLUDED
        </b>
       </font>
      </p>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          NO, the frame is not included
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         3. DO YOU ACCEPT RETURNS?
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          We do accept returns made within 30 days of delivery.
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          The Item MUST:
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          -Arrive back at our warehouses in good condition as it will be inspected by our staff.
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          - The return or exchange request is made within 30 days of delivery ( NOT LATER THAN THAT)
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         <span style="font-size:12px;">
          -Make sure you pack the print very well so it doesn't arrive damaged and we can issue you a full refund back to your account.
         </span>
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         4. ARE RETURNS OR EXCHANGES FREE?*
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          Returns or exchanges within the U.S.A are free.
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         <span style="font-size:12px;">
          International returns or exchanges are NOT FREE.  These are the responsibility of the buyer.No exceptions
         </span>
         .
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         5. WHAT SHOULD I DO IF SOMETHING IS MISSING IN MY ORDER OR IS DAMAGED?
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          If any of your purchased items are missing or are damaged please contact us immediately to resolve the issue. We have a 30-day Money Back Guarantee from the day the order was shipped. Please
          <a target="_blank">
           contact us
          </a>
          within the time frame and we will be happy to assist you.
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         6. WHICH SHIPPING COURIER DO YOU USE?
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          We mostly use USPS for orders in the U.S.A and for international orders, we use Ebay?s shipping services.
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         7. WHEN WILL I RECEIVE MY ORDER?
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          All orders are shipped out within the eBay processing and handling time guidelines and are shipped out by USPS or eBay International services. Please use the tracking number provided on your order detailed page for more information about your package.
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         8. THE TRACKING NUMBER SAYS DELIVERED, BUT I HAVEN'T RECEIVED MY ORDER?
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <span style="font-size:12px;">
         <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
          If the package shows on your order detailed page as delivered, you should get in direct contact with the courier company who delivered your package. They are now responsible for the delivery of the goods.
         </b>
        </span>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
      <p dir="ltr">
       <font rwr="1" size="4" style="font-family:Arial">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         9. WHAT DO I DO IF SOMETHING IS MISSING OR DAMAGED IN MY ORDER?
        </b>
       </font>
      </p>
      <font rwr="1" size="4" style="font-family:Arial">
      </font>
     </li>
    </ul>
    <p>
     <font rwr="1" size="4" style="font-family:Arial">
      <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
       <span style="font-size:12px;">
        <b id="docs-internal-guid-cc46e728-7fff-cb79-6855-942b9e7677f1">
         If any of your purchased items are missing or are damaged please contact us immediately to resolve the issue. We have a 30-day Money Back Guarantee from the day the order was shipped. Please
         <a target="_blank">
          contact us
         </a>
         within that time frame and we will be happy to assist you.
        </b>
       </span>
      </b>
     </font>
    </p>
   </div>
  </div>
 </div>
 <div style="border-left: 1px solid #CACFD6; border-right: 1px solid #CACFD6; border-bottom: 1px solid #CACFD6; border-top: 1px solid #CACFD6; color: #273C2C; line-height: 25px">
  <div class="container" style="padding: 40px 0 40px 0">
   <div class="col-12 col-md-12">
    <h2 style="line-height: 45px">
     <font rwr="1" size="4" style="font-family:Arial">
      <font face="Arial">
       Terms and Conditions
      </font>
     </font>
    </h2>
    <hr align="left" style="background: #273C2C; height: 1px; width: 10%"/>
    <p>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
    </p>
   </div>
   <table class="table table-responsive table-borderless" style="color: #273C2C; line-height: 25px; font-size: 16px; margin-top: 30px">
    <tbody>
     <tr>
      <th scope="row" style="color: #000">
       <font rwr="1" size="4" style="font-family:Arial">
       </font>
      </th>
      <td>
       <ul>
        <li aria-level="1" dir="ltr">
         <p dir="ltr" role="presentation">
          <font rwr="1" size="4" style="font-family:Arial">
           <b id="docs-internal-guid-5768ca0b-7fff-9aaa-32b5-16f52de87ed4">
            Once a bid has been placed, it is a legally binding contract of purchase
           </b>
          </font>
         </p>
        </li>
        <li aria-level="1" dir="ltr">
         <p dir="ltr" role="presentation">
          <font rwr="1" size="4" style="font-family:Arial">
           <b id="docs-internal-guid-5768ca0b-7fff-9aaa-32b5-16f52de87ed4">
            Payment must be received within 24 hours of purchase
           </b>
          </font>
         </p>
        </li>
        <li aria-level="1" dir="ltr">
         <p dir="ltr" role="presentation">
          <font rwr="1" size="4" style="font-family:Arial">
           <b id="docs-internal-guid-5768ca0b-7fff-9aaa-32b5-16f52de87ed4">
            If payment is not received within 4  days of purchase then a Non-Paying Buyer Dispute  will be filed, and 10 days later a final fee credit lodged
           </b>
          </font>
         </p>
        </li>
        <li aria-level="1" dir="ltr">
         <p dir="ltr" role="presentation">
          <font rwr="1" size="4" style="font-family:Arial">
           <b id="docs-internal-guid-5768ca0b-7fff-9aaa-32b5-16f52de87ed4">
            The number sold is based on availability
           </b>
          </font>
         </p>
        </li>
        <li aria-level="1" dir="ltr">
         <p dir="ltr" role="presentation">
          <font rwr="1" size="4" style="font-family:Arial">
           <b id="docs-internal-guid-5768ca0b-7fff-9aaa-32b5-16f52de87ed4">
            You will be notified on the day that your goods have been despatched via e-mail
           </b>
          </font>
         </p>
        </li>
        <li aria-level="1" dir="ltr">
         <p dir="ltr" role="presentation">
          <font rwr="1" size="4" style="font-family:Arial">
           <b id="docs-internal-guid-5768ca0b-7fff-9aaa-32b5-16f52de87ed4">
            Once you receive your goods, please inspect them for any damage during transit, and report the said damage within 24hrs via e-mail. If all is well please leave feedback, so we are aware that you have received your goods. Please note that if there are any problems, contact us first via e-mail giving full details of any problem along with your
           </b>
          </font>
         </p>
        </li>
       </ul>
      </td>
     </tr>
    </tbody>
   </table>
  </div>
  <div class="col-12 col-md-12 element" style="border-top: 1px solid #CACFD6; color: #273C2C; line-height: 25px">
   <div class="container" style="padding: 20px 0 10px 0; font-size: 80%; text-align: center">
    <p>
     <font rwr="1" size="4" style="font-family:Arial">
      <font face="Arial">
       Finest Wall Decor ®
      </font>
     </font>
    </p>
    <p>
     <font rwr="1" size="4" style="font-family:Arial">
     </font>
    </p>
   </div>
  </div>
 </div>
</div>