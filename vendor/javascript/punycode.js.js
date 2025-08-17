<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
const o=2147483647;const t=36;const n=1;const e=26;const r=38;const c=700;const s=72;const i=128;const l="-";const u=/^xn--/;const f=/[^\0-\x7F]/;const a=/[\x2E\u3002\uFF0E\uFF61]/g;const d={overflow:"Overflow: input needs wider integers to process","not-basic":"Illegal input >= 0x80 (not a basic code point)","invalid-input":"Invalid input"};const h=t-n;const p=Math.floor;const g=String.fromCharCode;
=======
// punycode.js@2.3.1 downloaded from https://cdn.jsdelivr.net/npm/punycode.js@2.3.1/punycode.es6.js

'use strict';

/** Highest positive signed 32-bit float value */
const maxInt = 2147483647; // aka. 0x7FFFFFFF or 2^31-1

/** Bootstring parameters */
const base = 36;
const tMin = 1;
const tMax = 26;
const skew = 38;
const damp = 700;
const initialBias = 72;
const initialN = 128; // 0x80
const delimiter = '-'; // '\x2D'

/** Regular expressions */
const regexPunycode = /^xn--/;
const regexNonASCII = /[^\0-\x7F]/; // Note: U+007F DEL is excluded too.
const regexSeparators = /[\x2E\u3002\uFF0E\uFF61]/g; // RFC 3490 separators

/** Error messages */
const errors = {
	'overflow': 'Overflow: input needs wider integers to process',
	'not-basic': 'Illegal input >= 0x80 (not a basic code point)',
	'invalid-input': 'Invalid input'
};

/** Convenience shortcuts */
const baseMinusTMin = base - tMin;
const floor = Math.floor;
const stringFromCharCode = String.fromCharCode;

/*--------------------------------------------------------------------------*/

>>>>>>> dev:vendor/javascript/punycode.js.js
/**
 * A generic error utility function.
 * @private
 * @param {String} type The error type.
 * @returns {Error} Throws a `RangeError` with the applicable error message.
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */function error(o){throw new RangeError(d[o])}
=======
 */
function error(type) {
	throw new RangeError(errors[type]);
}

>>>>>>> dev:vendor/javascript/punycode.js.js
/**
 * A generic `Array#map` utility function.
 * @private
 * @param {Array} array The array to iterate over.
 * @param {Function} callback The function that gets called for every array
 * item.
 * @returns {Array} A new array of values returned by the callback function.
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */function map(o,t){const n=[];let e=o.length;while(e--)n[e]=t(o[e]);return n}
=======
 */
function map(array, callback) {
	const result = [];
	let length = array.length;
	while (length--) {
		result[length] = callback(array[length]);
	}
	return result;
}

>>>>>>> dev:vendor/javascript/punycode.js.js
/**
 * A simple `Array#map`-like wrapper to work with domain name strings or email
 * addresses.
 * @private
 * @param {String} domain The domain name or email address.
 * @param {Function} callback The function that gets called for every
 * character.
 * @returns {String} A new string of characters returned by the callback
 * function.
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */function mapDomain(o,t){const n=o.split("@");let e="";if(n.length>1){e=n[0]+"@";o=n[1]}o=o.replace(a,".");const r=o.split(".");const c=map(r,t).join(".");return e+c}
=======
 */
function mapDomain(domain, callback) {
	const parts = domain.split('@');
	let result = '';
	if (parts.length > 1) {
		// In email addresses, only the domain name should be punycoded. Leave
		// the local part (i.e. everything up to `@`) intact.
		result = parts[0] + '@';
		domain = parts[1];
	}
	// Avoid `split(regex)` for IE8 compatibility. See #17.
	domain = domain.replace(regexSeparators, '\x2E');
	const labels = domain.split('.');
	const encoded = map(labels, callback).join('.');
	return result + encoded;
}

>>>>>>> dev:vendor/javascript/punycode.js.js
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
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */function ucs2decode(o){const t=[];let n=0;const e=o.length;while(n<e){const r=o.charCodeAt(n++);if(r>=55296&&r<=56319&&n<e){const e=o.charCodeAt(n++);if(56320==(64512&e))t.push(((1023&r)<<10)+(1023&e)+65536);else{t.push(r);n--}}else t.push(r)}return t}
=======
 */
function ucs2decode(string) {
	const output = [];
	let counter = 0;
	const length = string.length;
	while (counter < length) {
		const value = string.charCodeAt(counter++);
		if (value >= 0xD800 && value <= 0xDBFF && counter < length) {
			// It's a high surrogate, and there is a next character.
			const extra = string.charCodeAt(counter++);
			if ((extra & 0xFC00) == 0xDC00) { // Low surrogate.
				output.push(((value & 0x3FF) << 10) + (extra & 0x3FF) + 0x10000);
			} else {
				// It's an unmatched surrogate; only append this code unit, in case the
				// next code unit is the high surrogate of a surrogate pair.
				output.push(value);
				counter--;
			}
		} else {
			output.push(value);
		}
	}
	return output;
}

>>>>>>> dev:vendor/javascript/punycode.js.js
/**
 * Creates a string based on an array of numeric code points.
 * @see `punycode.ucs2.decode`
 * @memberOf punycode.ucs2
 * @name encode
 * @param {Array} codePoints The array of numeric code points.
 * @returns {String} The new Unicode string (UCS-2).
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */const ucs2encode=o=>String.fromCodePoint(...o)
=======
 */
const ucs2encode = codePoints => String.fromCodePoint(...codePoints);

>>>>>>> dev:vendor/javascript/punycode.js.js
/**
 * Converts a basic code point into a digit/integer.
 * @see `digitToBasic()`
 * @private
 * @param {Number} codePoint The basic numeric code point value.
 * @returns {Number} The numeric value of a basic code point (for use in
 * representing integers) in the range `0` to `base - 1`, or `base` if
 * the code point does not represent a value.
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */;const basicToDigit=function(o){return o>=48&&o<58?o-48+26:o>=65&&o<91?o-65:o>=97&&o<123?o-97:t};
=======
 */
const basicToDigit = function(codePoint) {
	if (codePoint >= 0x30 && codePoint < 0x3A) {
		return 26 + (codePoint - 0x30);
	}
	if (codePoint >= 0x41 && codePoint < 0x5B) {
		return codePoint - 0x41;
	}
	if (codePoint >= 0x61 && codePoint < 0x7B) {
		return codePoint - 0x61;
	}
	return base;
};

>>>>>>> dev:vendor/javascript/punycode.js.js
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
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */const digitToBasic=function(o,t){return o+22+75*(o<26)-((0!=t)<<5)};const adapt=function(o,n,s){let i=0;o=s?p(o/c):o>>1;o+=p(o/n);for(;o>h*e>>1;i+=t)o=p(o/h);return p(i+(h+1)*o/(o+r))};
=======
 */
const digitToBasic = function(digit, flag) {
	//  0..25 map to ASCII a..z or A..Z
	// 26..35 map to ASCII 0..9
	return digit + 22 + 75 * (digit < 26) - ((flag != 0) << 5);
};

/**
 * Bias adaptation function as per section 3.4 of RFC 3492.
 * https://tools.ietf.org/html/rfc3492#section-3.4
 * @private
 */
const adapt = function(delta, numPoints, firstTime) {
	let k = 0;
	delta = firstTime ? floor(delta / damp) : delta >> 1;
	delta += floor(delta / numPoints);
	for (/* no initialization */; delta > baseMinusTMin * tMax >> 1; k += base) {
		delta = floor(delta / baseMinusTMin);
	}
	return floor(k + (baseMinusTMin + 1) * delta / (delta + skew));
};

>>>>>>> dev:vendor/javascript/punycode.js.js
/**
 * Converts a Punycode string of ASCII-only symbols to a string of Unicode
 * symbols.
 * @memberOf punycode
 * @param {String} input The Punycode string of ASCII-only symbols.
 * @returns {String} The resulting string of Unicode symbols.
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */const decode=function(r){const c=[];const u=r.length;let f=0;let a=i;let d=s;let h=r.lastIndexOf(l);h<0&&(h=0);for(let o=0;o<h;++o){r.charCodeAt(o)>=128&&error("not-basic");c.push(r.charCodeAt(o))}for(let s=h>0?h+1:0;s<u;){const i=f;for(let c=1,i=t;;i+=t){s>=u&&error("invalid-input");const l=basicToDigit(r.charCodeAt(s++));l>=t&&error("invalid-input");l>p((o-f)/c)&&error("overflow");f+=l*c;const a=i<=d?n:i>=d+e?e:i-d;if(l<a)break;const h=t-a;c>p(o/h)&&error("overflow");c*=h}const l=c.length+1;d=adapt(f-i,l,0==i);p(f/l)>o-a&&error("overflow");a+=p(f/l);f%=l;c.splice(f++,0,a)}return String.fromCodePoint(...c)};
=======
 */
const decode = function(input) {
	// Don't use UCS-2.
	const output = [];
	const inputLength = input.length;
	let i = 0;
	let n = initialN;
	let bias = initialBias;

	// Handle the basic code points: let `basic` be the number of input code
	// points before the last delimiter, or `0` if there is none, then copy
	// the first basic code points to the output.

	let basic = input.lastIndexOf(delimiter);
	if (basic < 0) {
		basic = 0;
	}

	for (let j = 0; j < basic; ++j) {
		// if it's not a basic code point
		if (input.charCodeAt(j) >= 0x80) {
			error('not-basic');
		}
		output.push(input.charCodeAt(j));
	}

	// Main decoding loop: start just after the last delimiter if any basic code
	// points were copied; start at the beginning otherwise.

	for (let index = basic > 0 ? basic + 1 : 0; index < inputLength; /* no final expression */) {

		// `index` is the index of the next character to be consumed.
		// Decode a generalized variable-length integer into `delta`,
		// which gets added to `i`. The overflow checking is easier
		// if we increase `i` as we go, then subtract off its starting
		// value at the end to obtain `delta`.
		const oldi = i;
		for (let w = 1, k = base; /* no condition */; k += base) {

			if (index >= inputLength) {
				error('invalid-input');
			}

			const digit = basicToDigit(input.charCodeAt(index++));

			if (digit >= base) {
				error('invalid-input');
			}
			if (digit > floor((maxInt - i) / w)) {
				error('overflow');
			}

			i += digit * w;
			const t = k <= bias ? tMin : (k >= bias + tMax ? tMax : k - bias);

			if (digit < t) {
				break;
			}

			const baseMinusT = base - t;
			if (w > floor(maxInt / baseMinusT)) {
				error('overflow');
			}

			w *= baseMinusT;

		}

		const out = output.length + 1;
		bias = adapt(i - oldi, out, oldi == 0);

		// `i` was supposed to wrap around from `out` to `0`,
		// incrementing `n` each time, so we'll fix that now:
		if (floor(i / out) > maxInt - n) {
			error('overflow');
		}

		n += floor(i / out);
		i %= out;

		// Insert `n` at position `i` of the output.
		output.splice(i++, 0, n);

	}

	return String.fromCodePoint(...output);
};

>>>>>>> dev:vendor/javascript/punycode.js.js
/**
 * Converts a string of Unicode symbols (e.g. a domain name label) to a
 * Punycode string of ASCII-only symbols.
 * @memberOf punycode
 * @param {String} input The string of Unicode symbols.
 * @returns {String} The resulting Punycode string of ASCII-only symbols.
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */const encode=function(r){const c=[];r=ucs2decode(r);const u=r.length;let f=i;let a=0;let d=s;for(const o of r)o<128&&c.push(g(o));const h=c.length;let w=h;h&&c.push(l);while(w<u){let s=o;for(const o of r)o>=f&&o<s&&(s=o);const i=w+1;s-f>p((o-a)/i)&&error("overflow");a+=(s-f)*i;f=s;for(const s of r){s<f&&++a>o&&error("overflow");if(s===f){let o=a;for(let r=t;;r+=t){const s=r<=d?n:r>=d+e?e:r-d;if(o<s)break;const i=o-s;const l=t-s;c.push(g(digitToBasic(s+i%l,0)));o=p(i/l)}c.push(g(digitToBasic(o,0)));d=adapt(a,i,w===h);a=0;++w}}++a;++f}return c.join("")};
=======
 */
const encode = function(input) {
	const output = [];

	// Convert the input in UCS-2 to an array of Unicode code points.
	input = ucs2decode(input);

	// Cache the length.
	const inputLength = input.length;

	// Initialize the state.
	let n = initialN;
	let delta = 0;
	let bias = initialBias;

	// Handle the basic code points.
	for (const currentValue of input) {
		if (currentValue < 0x80) {
			output.push(stringFromCharCode(currentValue));
		}
	}

	const basicLength = output.length;
	let handledCPCount = basicLength;

	// `handledCPCount` is the number of code points that have been handled;
	// `basicLength` is the number of basic code points.

	// Finish the basic string with a delimiter unless it's empty.
	if (basicLength) {
		output.push(delimiter);
	}

	// Main encoding loop:
	while (handledCPCount < inputLength) {

		// All non-basic code points < n have been handled already. Find the next
		// larger one:
		let m = maxInt;
		for (const currentValue of input) {
			if (currentValue >= n && currentValue < m) {
				m = currentValue;
			}
		}

		// Increase `delta` enough to advance the decoder's <n,i> state to <m,0>,
		// but guard against overflow.
		const handledCPCountPlusOne = handledCPCount + 1;
		if (m - n > floor((maxInt - delta) / handledCPCountPlusOne)) {
			error('overflow');
		}

		delta += (m - n) * handledCPCountPlusOne;
		n = m;

		for (const currentValue of input) {
			if (currentValue < n && ++delta > maxInt) {
				error('overflow');
			}
			if (currentValue === n) {
				// Represent delta as a generalized variable-length integer.
				let q = delta;
				for (let k = base; /* no condition */; k += base) {
					const t = k <= bias ? tMin : (k >= bias + tMax ? tMax : k - bias);
					if (q < t) {
						break;
					}
					const qMinusT = q - t;
					const baseMinusT = base - t;
					output.push(
						stringFromCharCode(digitToBasic(t + qMinusT % baseMinusT, 0))
					);
					q = floor(qMinusT / baseMinusT);
				}

				output.push(stringFromCharCode(digitToBasic(q, 0)));
				bias = adapt(delta, handledCPCountPlusOne, handledCPCount === basicLength);
				delta = 0;
				++handledCPCount;
			}
		}

		++delta;
		++n;

	}
	return output.join('');
};

>>>>>>> dev:vendor/javascript/punycode.js.js
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
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */const toUnicode=function(o){return mapDomain(o,(function(o){return u.test(o)?decode(o.slice(4).toLowerCase()):o}))};
=======
 */
const toUnicode = function(input) {
	return mapDomain(input, function(string) {
		return regexPunycode.test(string)
			? decode(string.slice(4).toLowerCase())
			: string;
	});
};

>>>>>>> dev:vendor/javascript/punycode.js.js
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
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
 */const toASCII=function(o){return mapDomain(o,(function(o){return f.test(o)?"xn--"+encode(o):o}))};const w={
/**
=======
 */
const toASCII = function(input) {
	return mapDomain(input, function(string) {
		return regexNonASCII.test(string)
			? 'xn--' + encode(string)
			: string;
	});
};

/*--------------------------------------------------------------------------*/

/** Define the public API */
const punycode = {
	/**
>>>>>>> dev:vendor/javascript/punycode.js.js
	 * A string representing the current Punycode.js version number.
	 * @memberOf punycode
	 * @type String
	 */
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
version:"2.3.1",
/**
=======
	'version': '2.3.1',
	/**
>>>>>>> dev:vendor/javascript/punycode.js.js
	 * An object of methods to convert from JavaScript's internal character
	 * representation (UCS-2) to Unicode code points, and back.
	 * @see <https://mathiasbynens.be/notes/javascript-encoding>
	 * @memberOf punycode
	 * @type Object
	 */
<<<<<<< HEAD:personal/vendor/javascript/punycode.js.js
ucs2:{decode:ucs2decode,encode:ucs2encode},decode:decode,encode:encode,toASCII:toASCII,toUnicode:toUnicode};export{decode,w as default,encode,toASCII,toUnicode,ucs2decode,ucs2encode};

=======
	'ucs2': {
		'decode': ucs2decode,
		'encode': ucs2encode
	},
	'decode': decode,
	'encode': encode,
	'toASCII': toASCII,
	'toUnicode': toUnicode
};

export { ucs2decode, ucs2encode, decode, encode, toASCII, toUnicode };
export default punycode;
>>>>>>> dev:vendor/javascript/punycode.js.js
