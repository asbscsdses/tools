chrome.webRequest.onBeforeRequest.addListener(
  function(){ return {cancel: true}; },
  {
    urls: ["*://ajax.googleapis.com/*"], // Change this to a more specific pattern
    types: ["script"]
  },
  ["blocking"]
);