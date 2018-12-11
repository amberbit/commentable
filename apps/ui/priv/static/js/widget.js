/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ({

/***/ "./js/widget.js":
/*!**********************!*\
  !*** ./js/widget.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("var url = document.currentScript.src.replace(\"/js/widget.js\", \"\");\nvar container = document.createElement(\"div\");\ncontainer.setAttribute(\"id\", \"commentable-thread\");\ndocument.currentScript.parentNode.insertBefore(container, document.currentScript);\nvar iframe = document.createElement(\"iframe\");\niframe.style.width = \"\".concat(container.offsetWidth, \"px\");\niframe.style.height = \"0px\";\niframe.style.border = \"none\";\niframe.setAttribute(\"src\", \"\".concat(url, \"?url=\").concat(window.location.href));\n\nfunction receiver(e) {\n  if (e.data[\"x-commentable-message-height\"] !== undefined) {\n    iframe.style.height = \"\".concat(e.data[\"x-commentable-message-height\"], \"px\");\n  }\n}\n\niframe.onload = function () {\n  iframe.contentWindow.postMessage(\"x-commentable-message-resize-me\", \"*\");\n};\n\ncontainer.appendChild(iframe);\nwindow.addEventListener(\"message\", receiver, false);\n\n//# sourceURL=webpack:///./js/widget.js?");

/***/ }),

/***/ 1:
/*!****************************!*\
  !*** multi ./js/widget.js ***!
  \****************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("module.exports = __webpack_require__(/*! ./js/widget.js */\"./js/widget.js\");\n\n\n//# sourceURL=webpack:///multi_./js/widget.js?");

/***/ })

/******/ });