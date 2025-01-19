const o=2147483647;const t=36;const n=1;const e=26;const r=38;const c=700;const s=72;const i=128;const l="-";const u=/^xn--/;const f=/[^\0-\x7F]/;const a=/[\x2E\u3002\uFF0E\uFF61]/g;const d={overflow:"Overflow: input needs wider integers to process","not-basic":"Illegal input >= 0x80 (not a basic code point)","invalid-input":"Invalid input"};const h=t-n;const p=Math.floor;const g=String.fromCharCode;
/**
 * A generic error utility function.
 * @private
 * @param {String} type The error type.
 * @returns {Error} Throws a `RangeError` with the applicable error message.
 */function error(o){throw new RangeError(d[o])}
/**
 * A generic `Array#map` utility function.
 * @private
 * @param {Array} array The array to iterate over.
 * @param {Function} callback The function that gets called for every array
 * item.
 * @returns {Array} A new array of values returned by the callback function.
 */function map(o,t){const n=[];let e=o.length;while(e--)n[e]=t(o[e]);return n}
/**
 * A simple `Array#map`-like wrapper to work with domain name strings or email
 * addresses.
 * @private
 * @param {String} domain The domain name or email address.
 * @param {Function} callback The function that gets called for every
 * character.
 * @returns {String} A new string of characters returned by the callback
 * function.
 */function mapDomain(o,t){const n=o.split("@");let e="";if(n.length>1){e=n[0]+"@";o=n[1]}o=o.replace(a,".");const r=o.split(".");const c=map(r,t).join(".");return e+c}
/**
 * Creates an array containing the numeric code points of each Unicode
 * character in the string. While JavaScript uses UCS-2 internally,
 * this function will convert a pair of surrogate halves (each of which
 * UCS-2 exposes as separate characters) into a single code point,
 * matching UTF-16.
 * @see `punycode.ucs2.encode`
 * @see <https://mathiasbynens.be/notes/javascript-encoding>
 * @memberOf punycode.ucs2
 * @name decode
 * @param {String} string The Unicode input string (UCS-2).
 * @returns {Array} The new array of code points.
 */function ucs2decode(o){const t=[];let n=0;const e=o.length;while(n<e){const r=o.charCodeAt(n++);if(r>=55296&&r<=56319&&n<e){const e=o.charCodeAt(n++);if(56320==(64512&e))t.push(((1023&r)<<10)+(1023&e)+65536);else{t.push(r);n--}}else t.push(r)}return t}
/**
 * Creates a string based on an array of numeric code points.
 * @see `punycode.ucs2.decode`
 * @memberOf punycode.ucs2
 * @name encode
 * @param {Array} codePoints The array of numeric code points.
 * @returns {String} The new Unicode string (UCS-2).
 */const ucs2encode=o=>String.fromCodePoint(...o)
/**
 * Converts a basic code point into a digit/integer.
 * @see `digitToBasic()`
 * @private
 * @param {Number} codePoint The basic numeric code point value.
 * @returns {Number} The numeric value of a basic code point (for use in
 * representing integers) in the range `0` to `base - 1`, or `base` if
 * the code point does not represent a value.
 */;const basicToDigit=function(o){return o>=48&&o<58?o-48+26:o>=65&&o<91?o-65:o>=97&&o<123?o-97:t};
/**
 * Converts a digit/integer into a basic code point.
 * @see `basicToDigit()`
 * @private
 * @param {Number} digit The numeric value of a basic code point.
 * @returns {Number} The basic code point whose value (when used for
 * representing integers) is `digit`, which needs to be in the range
 * `0` to `base - 1`. If `flag` is non-zero, the uppercase form is
 * used; else, the lowercase form is used. The behavior is undefined
 * if `flag` is non-zero and `digit` has no uppercase form.
 */const digitToBasic=function(o,t){return o+22+75*(o<26)-((0!=t)<<5)};const adapt=function(o,n,s){let i=0;o=s?p(o/c):o>>1;o+=p(o/n);for(;o>h*e>>1;i+=t)o=p(o/h);return p(i+(h+1)*o/(o+r))};
/**
 * Converts a Punycode string of ASCII-only symbols to a string of Unicode
 * symbols.
 * @memberOf punycode
 * @param {String} input The Punycode string of ASCII-only symbols.
 * @returns {String} The resulting string of Unicode symbols.
 */const decode=function(r){const c=[];const u=r.length;let f=0;let a=i;let d=s;let h=r.lastIndexOf(l);h<0&&(h=0);for(let o=0;o<h;++o){r.charCodeAt(o)>=128&&error("not-basic");c.push(r.charCodeAt(o))}for(let s=h>0?h+1:0;s<u;){const i=f;for(let c=1,i=t;;i+=t){s>=u&&error("invalid-input");const l=basicToDigit(r.charCodeAt(s++));l>=t&&error("invalid-input");l>p((o-f)/c)&&error("overflow");f+=l*c;const a=i<=d?n:i>=d+e?e:i-d;if(l<a)break;const h=t-a;c>p(o/h)&&error("overflow");c*=h}const l=c.length+1;d=adapt(f-i,l,0==i);p(f/l)>o-a&&error("overflow");a+=p(f/l);f%=l;c.splice(f++,0,a)}return String.fromCodePoint(...c)};
/**
 * Converts a string of Unicode symbols (e.g. a domain name label) to a
 * Punycode string of ASCII-only symbols.
 * @memberOf punycode
 * @param {String} input The string of Unicode symbols.
 * @returns {String} The resulting Punycode string of ASCII-only symbols.
 */const encode=function(r){const c=[];r=ucs2decode(r);const u=r.length;let f=i;let a=0;let d=s;for(const o of r)o<128&&c.push(g(o));const h=c.length;let w=h;h&&c.push(l);while(w<u){let s=o;for(const o of r)o>=f&&o<s&&(s=o);const i=w+1;s-f>p((o-a)/i)&&error("overflow");a+=(s-f)*i;f=s;for(const s of r){s<f&&++a>o&&error("overflow");if(s===f){let o=a;for(let r=t;;r+=t){const s=r<=d?n:r>=d+e?e:r-d;if(o<s)break;const i=o-s;const l=t-s;c.push(g(digitToBasic(s+i%l,0)));o=p(i/l)}c.push(g(digitToBasic(o,0)));d=adapt(a,i,w===h);a=0;++w}}++a;++f}return c.join("")};
/**
 * Converts a Punycode string representing a domain name or an email address
 * to Unicode. Only the Punycoded parts of the input will be converted, i.e.
 * it doesn't matter if you call it on a string that has already been
 * converted to Unicode.
 * @memberOf punycode
 * @param {String} input The Punycoded domain name or email address to
 * convert to Unicode.
 * @returns {String} The Unicode representation of the given Punycode
 * string.
 */const toUnicode=function(o){return mapDomain(o,(function(o){return u.test(o)?decode(o.slice(4).toLowerCase()):o}))};
/**
 * Converts a Unicode string representing a domain name or an email address to
 * Punycode. Only the non-ASCII parts of the domain name will be converted,
 * i.e. it doesn't matter if you call it with a domain that's already in
 * ASCII.
 * @memberOf punycode
 * @param {String} input The domain name or email address to convert, as a
 * Unicode string.
 * @returns {String} The Punycode representation of the given domain name or
 * email address.
 */const toASCII=function(o){return mapDomain(o,(function(o){return f.test(o)?"xn--"+encode(o):o}))};const w={
/**
	 * A string representing the current Punycode.js version number.
	 * @memberOf punycode
	 * @type String
	 */
version:"2.3.1",
/**
	 * An object of methods to convert from JavaScript's internal character
	 * representation (UCS-2) to Unicode code points, and back.
	 * @see <https://mathiasbynens.be/notes/javascript-encoding>
	 * @memberOf punycode
	 * @type Object
	 */
ucs2:{decode:ucs2decode,encode:ucs2encode},decode:decode,encode:encode,toASCII:toASCII,toUnicode:toUnicode};export{decode,w as default,encode,toASCII,toUnicode,ucs2decode,ucs2encode};

