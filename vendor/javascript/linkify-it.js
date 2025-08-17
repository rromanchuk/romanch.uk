<<<<<<< HEAD:personal/vendor/javascript/linkify-it.js
import{Any as t,Cc as _,Z as e,P as s}from"uc.micro";function reFactory(i){const r={};i=i||{};r.src_Any=t.source;r.src_Cc=_.source;r.src_Z=e.source;r.src_P=s.source;r.src_ZPCc=[r.src_Z,r.src_P,r.src_Cc].join("|");r.src_ZCc=[r.src_Z,r.src_Cc].join("|");const c="[><｜]";r.src_pseudo_letter="(?:(?!"+c+"|"+r.src_ZPCc+")"+r.src_Any+")";r.src_ip4="(?:(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)";r.src_auth="(?:(?:(?!"+r.src_ZCc+"|[@/\\[\\]()]).)+@)?";r.src_port="(?::(?:6(?:[0-4]\\d{3}|5(?:[0-4]\\d{2}|5(?:[0-2]\\d|3[0-5])))|[1-5]?\\d{1,4}))?";r.src_host_terminator="(?=$|"+c+"|"+r.src_ZPCc+")(?!"+(i["---"]?"-(?!--)|":"-|")+"_|:\\d|\\.-|\\.(?!$|"+r.src_ZPCc+"))";r.src_path="(?:[/?#](?:(?!"+r.src_ZCc+"|"+c+"|[()[\\]{}.,\"'?!\\-;]).|\\[(?:(?!"+r.src_ZCc+"|\\]).)*\\]|\\((?:(?!"+r.src_ZCc+"|[)]).)*\\)|\\{(?:(?!"+r.src_ZCc+'|[}]).)*\\}|\\"(?:(?!'+r.src_ZCc+'|["]).)+\\"|\\\'(?:(?!'+r.src_ZCc+"|[']).)+\\'|\\'(?="+r.src_pseudo_letter+"|[-])|\\.{2,}[a-zA-Z0-9%/&]|\\.(?!"+r.src_ZCc+"|[.]|$)|"+(i["---"]?"\\-(?!--(?:[^-]|$))(?:-*)|":"\\-+|")+",(?!"+r.src_ZCc+"|$)|;(?!"+r.src_ZCc+"|$)|\\!+(?!"+r.src_ZCc+"|[!]|$)|\\?(?!"+r.src_ZCc+"|[?]|$))+|\\/)?";r.src_email_name='[\\-;:&=\\+\\$,\\.a-zA-Z0-9_][\\-;:&=\\+\\$,\\"\\.a-zA-Z0-9_]*';r.src_xn="xn--[a-z0-9\\-]{1,59}";r.src_domain_root="(?:"+r.src_xn+"|"+r.src_pseudo_letter+"{1,63})";r.src_domain="(?:"+r.src_xn+"|(?:"+r.src_pseudo_letter+")|(?:"+r.src_pseudo_letter+"(?:-|"+r.src_pseudo_letter+"){0,61}"+r.src_pseudo_letter+"))";r.src_host="(?:(?:(?:(?:"+r.src_domain+")\\.)*"+r.src_domain+"))";r.tpl_host_fuzzy="(?:"+r.src_ip4+"|(?:(?:(?:"+r.src_domain+")\\.)+(?:%TLDS%)))";r.tpl_host_no_ip_fuzzy="(?:(?:(?:"+r.src_domain+")\\.)+(?:%TLDS%))";r.src_host_strict=r.src_host+r.src_host_terminator;r.tpl_host_fuzzy_strict=r.tpl_host_fuzzy+r.src_host_terminator;r.src_host_port_strict=r.src_host+r.src_port+r.src_host_terminator;r.tpl_host_port_fuzzy_strict=r.tpl_host_fuzzy+r.src_port+r.src_host_terminator;r.tpl_host_port_no_ip_fuzzy_strict=r.tpl_host_no_ip_fuzzy+r.src_port+r.src_host_terminator;r.tpl_host_fuzzy_test="localhost|www\\.|\\.\\d{1,3}\\.|(?:\\.(?:%TLDS%)(?:"+r.src_ZPCc+"|>|$))";r.tpl_email_fuzzy="(^|"+c+'|"|\\(|'+r.src_ZCc+")("+r.src_email_name+"@"+r.tpl_host_fuzzy_strict+")";r.tpl_link_fuzzy="(^|(?![.:/\\-_@])(?:[$+<=>^`|｜]|"+r.src_ZPCc+"))((?![$+<=>^`|｜])"+r.tpl_host_port_fuzzy_strict+r.src_path+")";r.tpl_link_no_ip_fuzzy="(^|(?![.:/\\-_@])(?:[$+<=>^`|｜]|"+r.src_ZPCc+"))((?![$+<=>^`|｜])"+r.tpl_host_port_no_ip_fuzzy_strict+r.src_path+")";return r}function assign(t){const _=Array.prototype.slice.call(arguments,1);_.forEach((function(_){_&&Object.keys(_).forEach((function(e){t[e]=_[e]}))}));return t}function _class(t){return Object.prototype.toString.call(t)}function isString(t){return _class(t)==="[object String]"}function isObject(t){return _class(t)==="[object Object]"}function isRegExp(t){return _class(t)==="[object RegExp]"}function isFunction(t){return _class(t)==="[object Function]"}function escapeRE(t){return t.replace(/[.?*+^$[\]\\(){}|-]/g,"\\$&")}const i={fuzzyLink:true,fuzzyEmail:true,fuzzyIP:false};function isOptionsObj(t){return Object.keys(t||{}).reduce((function(t,_){return t||i.hasOwnProperty(_)}),false)}const r={"http:":{validate:function(t,_,e){const s=t.slice(_);e.re.http||(e.re.http=new RegExp("^\\/\\/"+e.re.src_auth+e.re.src_host_port_strict+e.re.src_path,"i"));return e.re.http.test(s)?s.match(e.re.http)[0].length:0}},"https:":"http:","ftp:":"http:","//":{validate:function(t,_,e){const s=t.slice(_);e.re.no_http||(e.re.no_http=new RegExp("^"+e.re.src_auth+"(?:localhost|(?:(?:"+e.re.src_domain+")\\.)+"+e.re.src_domain_root+")"+e.re.src_port+e.re.src_host_terminator+e.re.src_path,"i"));return e.re.no_http.test(s)?_>=3&&t[_-3]===":"||_>=3&&t[_-3]==="/"?0:s.match(e.re.no_http)[0].length:0}},"mailto:":{validate:function(t,_,e){const s=t.slice(_);e.re.mailto||(e.re.mailto=new RegExp("^"+e.re.src_email_name+"@"+e.re.src_host_strict,"i"));return e.re.mailto.test(s)?s.match(e.re.mailto)[0].length:0}}};const c="a[cdefgilmnoqrstuwxz]|b[abdefghijmnorstvwyz]|c[acdfghiklmnoruvwxyz]|d[ejkmoz]|e[cegrstu]|f[ijkmor]|g[abdefghilmnpqrstuwy]|h[kmnrtu]|i[delmnoqrst]|j[emop]|k[eghimnprwyz]|l[abcikrstuvy]|m[acdeghklmnopqrstuvwxyz]|n[acefgilopruz]|om|p[aefghklmnrstwy]|qa|r[eosuw]|s[abcdeghijklmnortuvxyz]|t[cdfghjklmnortvwz]|u[agksyz]|v[aceginu]|w[fs]|y[et]|z[amw]";const n="biz|com|edu|gov|net|org|pro|web|xxx|aero|asia|coop|info|museum|name|shop|рф".split("|");function resetScanCache(t){t.__index__=-1;t.__text_cache__=""}function createValidator(t){return function(_,e){const s=_.slice(e);return t.test(s)?s.match(t)[0].length:0}}function createNormalizer(){return function(t,_){_.normalize(t)}}function compile(t){const _=t.re=reFactory(t.__opts__);const e=t.__tlds__.slice();t.onCompile();t.__tlds_replaced__||e.push(c);e.push(_.src_xn);_.src_tlds=e.join("|");function untpl(t){return t.replace("%TLDS%",_.src_tlds)}_.email_fuzzy=RegExp(untpl(_.tpl_email_fuzzy),"i");_.link_fuzzy=RegExp(untpl(_.tpl_link_fuzzy),"i");_.link_no_ip_fuzzy=RegExp(untpl(_.tpl_link_no_ip_fuzzy),"i");_.host_fuzzy_test=RegExp(untpl(_.tpl_host_fuzzy_test),"i");const s=[];t.__compiled__={};function schemaError(t,_){throw new Error('(LinkifyIt) Invalid schema "'+t+'": '+_)}Object.keys(t.__schemas__).forEach((function(_){const e=t.__schemas__[_];if(e===null)return;const i={validate:null,link:null};t.__compiled__[_]=i;if(isObject(e)){isRegExp(e.validate)?i.validate=createValidator(e.validate):isFunction(e.validate)?i.validate=e.validate:schemaError(_,e);isFunction(e.normalize)?i.normalize=e.normalize:e.normalize?schemaError(_,e):i.normalize=createNormalizer()}else isString(e)?s.push(_):schemaError(_,e)}));s.forEach((function(_){if(t.__compiled__[t.__schemas__[_]]){t.__compiled__[_].validate=t.__compiled__[t.__schemas__[_]].validate;t.__compiled__[_].normalize=t.__compiled__[t.__schemas__[_]].normalize}}));t.__compiled__[""]={validate:null,normalize:createNormalizer()};const i=Object.keys(t.__compiled__).filter((function(_){return _.length>0&&t.__compiled__[_]})).map(escapeRE).join("|");t.re.schema_test=RegExp("(^|(?!_)(?:[><｜]|"+_.src_ZPCc+"))("+i+")","i");t.re.schema_search=RegExp("(^|(?!_)(?:[><｜]|"+_.src_ZPCc+"))("+i+")","ig");t.re.schema_at_start=RegExp("^"+t.re.schema_search.source,"i");t.re.pretest=RegExp("("+t.re.schema_test.source+")|("+t.re.host_fuzzy_test.source+")|@","i");resetScanCache(t)}function Match(t,_){const e=t.__index__;const s=t.__last_index__;const i=t.__text_cache__.slice(e,s);this.schema=t.__schema__.toLowerCase();this.index=e+_;this.lastIndex=s+_;this.raw=i;this.text=i;this.url=i}function createMatch(t,_){const e=new Match(t,_);t.__compiled__[e.schema].normalize(e,t);return e}function LinkifyIt(t,_){if(!(this instanceof LinkifyIt))return new LinkifyIt(t,_);if(!_&&isOptionsObj(t)){_=t;t={}}this.__opts__=assign({},i,_);this.__index__=-1;this.__last_index__=-1;this.__schema__="";this.__text_cache__="";this.__schemas__=assign({},r,t);this.__compiled__={};this.__tlds__=n;this.__tlds_replaced__=false;this.re={};compile(this)}LinkifyIt.prototype.add=function add(t,_){this.__schemas__[t]=_;compile(this);return this};LinkifyIt.prototype.set=function set(t){this.__opts__=assign(this.__opts__,t);return this};LinkifyIt.prototype.test=function test(t){this.__text_cache__=t;this.__index__=-1;if(!t.length)return false;let _,e,s,i,r,c,n,o,a;if(this.re.schema_test.test(t)){n=this.re.schema_search;n.lastIndex=0;while((_=n.exec(t))!==null){i=this.testSchemaAt(t,_[2],n.lastIndex);if(i){this.__schema__=_[2];this.__index__=_.index+_[1].length;this.__last_index__=_.index+_[0].length+i;break}}}if(this.__opts__.fuzzyLink&&this.__compiled__["http:"]){o=t.search(this.re.host_fuzzy_test);if(o>=0&&(this.__index__<0||o<this.__index__)&&(e=t.match(this.__opts__.fuzzyIP?this.re.link_fuzzy:this.re.link_no_ip_fuzzy))!==null){r=e.index+e[1].length;if(this.__index__<0||r<this.__index__){this.__schema__="";this.__index__=r;this.__last_index__=e.index+e[0].length}}}if(this.__opts__.fuzzyEmail&&this.__compiled__["mailto:"]){a=t.indexOf("@");if(a>=0&&(s=t.match(this.re.email_fuzzy))!==null){r=s.index+s[1].length;c=s.index+s[0].length;if(this.__index__<0||r<this.__index__||r===this.__index__&&c>this.__last_index__){this.__schema__="mailto:";this.__index__=r;this.__last_index__=c}}}return this.__index__>=0};LinkifyIt.prototype.pretest=function pretest(t){return this.re.pretest.test(t)};LinkifyIt.prototype.testSchemaAt=function testSchemaAt(t,_,e){return this.__compiled__[_.toLowerCase()]?this.__compiled__[_.toLowerCase()].validate(t,e,this):0};LinkifyIt.prototype.match=function match(t){const _=[];let e=0;if(this.__index__>=0&&this.__text_cache__===t){_.push(createMatch(this,e));e=this.__last_index__}let s=e?t.slice(e):t;while(this.test(s)){_.push(createMatch(this,e));s=s.slice(this.__last_index__);e+=this.__last_index__}return _.length?_:null};LinkifyIt.prototype.matchAtStart=function matchAtStart(t){this.__text_cache__=t;this.__index__=-1;if(!t.length)return null;const _=this.re.schema_at_start.exec(t);if(!_)return null;const e=this.testSchemaAt(t,_[2],_[0].length);if(!e)return null;this.__schema__=_[2];this.__index__=_.index+_[1].length;this.__last_index__=_.index+_[0].length+e;return createMatch(this,0)};LinkifyIt.prototype.tlds=function tlds(t,_){t=Array.isArray(t)?t:[t];if(!_){this.__tlds__=t.slice();this.__tlds_replaced__=true;compile(this);return this}this.__tlds__=this.__tlds__.concat(t).sort().filter((function(t,_,e){return t!==e[_-1]})).reverse();compile(this);return this};LinkifyIt.prototype.normalize=function normalize(t){t.schema||(t.url="http://"+t.url);t.schema!=="mailto:"||/^mailto:/i.test(t.url)||(t.url="mailto:"+t.url)};LinkifyIt.prototype.onCompile=function onCompile(){};export{LinkifyIt as default};

=======
// linkify-it@5.0.0 downloaded from https://cdn.jsdelivr.net/npm/linkify-it@5.0.0/index.mjs

import reFactory from './lib/re.mjs'

//
// Helpers
//

// Merge objects
//
function assign (obj /* from1, from2, from3, ... */) {
  const sources = Array.prototype.slice.call(arguments, 1)

  sources.forEach(function (source) {
    if (!source) { return }

    Object.keys(source).forEach(function (key) {
      obj[key] = source[key]
    })
  })

  return obj
}

function _class (obj) { return Object.prototype.toString.call(obj) }
function isString (obj) { return _class(obj) === '[object String]' }
function isObject (obj) { return _class(obj) === '[object Object]' }
function isRegExp (obj) { return _class(obj) === '[object RegExp]' }
function isFunction (obj) { return _class(obj) === '[object Function]' }

function escapeRE (str) { return str.replace(/[.?*+^$[\]\\(){}|-]/g, '\\$&') }

//

const defaultOptions = {
  fuzzyLink: true,
  fuzzyEmail: true,
  fuzzyIP: false
}

function isOptionsObj (obj) {
  return Object.keys(obj || {}).reduce(function (acc, k) {
    /* eslint-disable-next-line no-prototype-builtins */
    return acc || defaultOptions.hasOwnProperty(k)
  }, false)
}

const defaultSchemas = {
  'http:': {
    validate: function (text, pos, self) {
      const tail = text.slice(pos)

      if (!self.re.http) {
        // compile lazily, because "host"-containing variables can change on tlds update.
        self.re.http = new RegExp(
          '^\\/\\/' + self.re.src_auth + self.re.src_host_port_strict + self.re.src_path, 'i'
        )
      }
      if (self.re.http.test(tail)) {
        return tail.match(self.re.http)[0].length
      }
      return 0
    }
  },
  'https:': 'http:',
  'ftp:': 'http:',
  '//': {
    validate: function (text, pos, self) {
      const tail = text.slice(pos)

      if (!self.re.no_http) {
      // compile lazily, because "host"-containing variables can change on tlds update.
        self.re.no_http = new RegExp(
          '^' +
          self.re.src_auth +
          // Don't allow single-level domains, because of false positives like '//test'
          // with code comments
          '(?:localhost|(?:(?:' + self.re.src_domain + ')\\.)+' + self.re.src_domain_root + ')' +
          self.re.src_port +
          self.re.src_host_terminator +
          self.re.src_path,

          'i'
        )
      }

      if (self.re.no_http.test(tail)) {
        // should not be `://` & `///`, that protects from errors in protocol name
        if (pos >= 3 && text[pos - 3] === ':') { return 0 }
        if (pos >= 3 && text[pos - 3] === '/') { return 0 }
        return tail.match(self.re.no_http)[0].length
      }
      return 0
    }
  },
  'mailto:': {
    validate: function (text, pos, self) {
      const tail = text.slice(pos)

      if (!self.re.mailto) {
        self.re.mailto = new RegExp(
          '^' + self.re.src_email_name + '@' + self.re.src_host_strict, 'i'
        )
      }
      if (self.re.mailto.test(tail)) {
        return tail.match(self.re.mailto)[0].length
      }
      return 0
    }
  }
}

// RE pattern for 2-character tlds (autogenerated by ./support/tlds_2char_gen.js)
/* eslint-disable-next-line max-len */
const tlds_2ch_src_re = 'a[cdefgilmnoqrstuwxz]|b[abdefghijmnorstvwyz]|c[acdfghiklmnoruvwxyz]|d[ejkmoz]|e[cegrstu]|f[ijkmor]|g[abdefghilmnpqrstuwy]|h[kmnrtu]|i[delmnoqrst]|j[emop]|k[eghimnprwyz]|l[abcikrstuvy]|m[acdeghklmnopqrstuvwxyz]|n[acefgilopruz]|om|p[aefghklmnrstwy]|qa|r[eosuw]|s[abcdeghijklmnortuvxyz]|t[cdfghjklmnortvwz]|u[agksyz]|v[aceginu]|w[fs]|y[et]|z[amw]'

// DON'T try to make PRs with changes. Extend TLDs with LinkifyIt.tlds() instead
const tlds_default = 'biz|com|edu|gov|net|org|pro|web|xxx|aero|asia|coop|info|museum|name|shop|рф'.split('|')

function resetScanCache (self) {
  self.__index__ = -1
  self.__text_cache__ = ''
}

function createValidator (re) {
  return function (text, pos) {
    const tail = text.slice(pos)

    if (re.test(tail)) {
      return tail.match(re)[0].length
    }
    return 0
  }
}

function createNormalizer () {
  return function (match, self) {
    self.normalize(match)
  }
}

// Schemas compiler. Build regexps.
//
function compile (self) {
  // Load & clone RE patterns.
  const re = self.re = reFactory(self.__opts__)

  // Define dynamic patterns
  const tlds = self.__tlds__.slice()

  self.onCompile()

  if (!self.__tlds_replaced__) {
    tlds.push(tlds_2ch_src_re)
  }
  tlds.push(re.src_xn)

  re.src_tlds = tlds.join('|')

  function untpl (tpl) { return tpl.replace('%TLDS%', re.src_tlds) }

  re.email_fuzzy = RegExp(untpl(re.tpl_email_fuzzy), 'i')
  re.link_fuzzy = RegExp(untpl(re.tpl_link_fuzzy), 'i')
  re.link_no_ip_fuzzy = RegExp(untpl(re.tpl_link_no_ip_fuzzy), 'i')
  re.host_fuzzy_test = RegExp(untpl(re.tpl_host_fuzzy_test), 'i')

  //
  // Compile each schema
  //

  const aliases = []

  self.__compiled__ = {} // Reset compiled data

  function schemaError (name, val) {
    throw new Error('(LinkifyIt) Invalid schema "' + name + '": ' + val)
  }

  Object.keys(self.__schemas__).forEach(function (name) {
    const val = self.__schemas__[name]

    // skip disabled methods
    if (val === null) { return }

    const compiled = { validate: null, link: null }

    self.__compiled__[name] = compiled

    if (isObject(val)) {
      if (isRegExp(val.validate)) {
        compiled.validate = createValidator(val.validate)
      } else if (isFunction(val.validate)) {
        compiled.validate = val.validate
      } else {
        schemaError(name, val)
      }

      if (isFunction(val.normalize)) {
        compiled.normalize = val.normalize
      } else if (!val.normalize) {
        compiled.normalize = createNormalizer()
      } else {
        schemaError(name, val)
      }

      return
    }

    if (isString(val)) {
      aliases.push(name)
      return
    }

    schemaError(name, val)
  })

  //
  // Compile postponed aliases
  //

  aliases.forEach(function (alias) {
    if (!self.__compiled__[self.__schemas__[alias]]) {
      // Silently fail on missed schemas to avoid errons on disable.
      // schemaError(alias, self.__schemas__[alias]);
      return
    }

    self.__compiled__[alias].validate =
      self.__compiled__[self.__schemas__[alias]].validate
    self.__compiled__[alias].normalize =
      self.__compiled__[self.__schemas__[alias]].normalize
  })

  //
  // Fake record for guessed links
  //
  self.__compiled__[''] = { validate: null, normalize: createNormalizer() }

  //
  // Build schema condition
  //
  const slist = Object.keys(self.__compiled__)
    .filter(function (name) {
      // Filter disabled & fake schemas
      return name.length > 0 && self.__compiled__[name]
    })
    .map(escapeRE)
    .join('|')
  // (?!_) cause 1.5x slowdown
  self.re.schema_test = RegExp('(^|(?!_)(?:[><\uff5c]|' + re.src_ZPCc + '))(' + slist + ')', 'i')
  self.re.schema_search = RegExp('(^|(?!_)(?:[><\uff5c]|' + re.src_ZPCc + '))(' + slist + ')', 'ig')
  self.re.schema_at_start = RegExp('^' + self.re.schema_search.source, 'i')

  self.re.pretest = RegExp(
    '(' + self.re.schema_test.source + ')|(' + self.re.host_fuzzy_test.source + ')|@',
    'i'
  )

  //
  // Cleanup
  //

  resetScanCache(self)
}

/**
 * class Match
 *
 * Match result. Single element of array, returned by [[LinkifyIt#match]]
 **/
function Match (self, shift) {
  const start = self.__index__
  const end = self.__last_index__
  const text = self.__text_cache__.slice(start, end)

  /**
   * Match#schema -> String
   *
   * Prefix (protocol) for matched string.
   **/
  this.schema = self.__schema__.toLowerCase()
  /**
   * Match#index -> Number
   *
   * First position of matched string.
   **/
  this.index = start + shift
  /**
   * Match#lastIndex -> Number
   *
   * Next position after matched string.
   **/
  this.lastIndex = end + shift
  /**
   * Match#raw -> String
   *
   * Matched string.
   **/
  this.raw = text
  /**
   * Match#text -> String
   *
   * Notmalized text of matched string.
   **/
  this.text = text
  /**
   * Match#url -> String
   *
   * Normalized url of matched string.
   **/
  this.url = text
}

function createMatch (self, shift) {
  const match = new Match(self, shift)

  self.__compiled__[match.schema].normalize(match, self)

  return match
}

/**
 * class LinkifyIt
 **/

/**
 * new LinkifyIt(schemas, options)
 * - schemas (Object): Optional. Additional schemas to validate (prefix/validator)
 * - options (Object): { fuzzyLink|fuzzyEmail|fuzzyIP: true|false }
 *
 * Creates new linkifier instance with optional additional schemas.
 * Can be called without `new` keyword for convenience.
 *
 * By default understands:
 *
 * - `http(s)://...` , `ftp://...`, `mailto:...` & `//...` links
 * - "fuzzy" links and emails (example.com, foo@bar.com).
 *
 * `schemas` is an object, where each key/value describes protocol/rule:
 *
 * - __key__ - link prefix (usually, protocol name with `:` at the end, `skype:`
 *   for example). `linkify-it` makes shure that prefix is not preceeded with
 *   alphanumeric char and symbols. Only whitespaces and punctuation allowed.
 * - __value__ - rule to check tail after link prefix
 *   - _String_ - just alias to existing rule
 *   - _Object_
 *     - _validate_ - validator function (should return matched length on success),
 *       or `RegExp`.
 *     - _normalize_ - optional function to normalize text & url of matched result
 *       (for example, for @twitter mentions).
 *
 * `options`:
 *
 * - __fuzzyLink__ - recognige URL-s without `http(s):` prefix. Default `true`.
 * - __fuzzyIP__ - allow IPs in fuzzy links above. Can conflict with some texts
 *   like version numbers. Default `false`.
 * - __fuzzyEmail__ - recognize emails without `mailto:` prefix.
 *
 **/
function LinkifyIt (schemas, options) {
  if (!(this instanceof LinkifyIt)) {
    return new LinkifyIt(schemas, options)
  }

  if (!options) {
    if (isOptionsObj(schemas)) {
      options = schemas
      schemas = {}
    }
  }

  this.__opts__ = assign({}, defaultOptions, options)

  // Cache last tested result. Used to skip repeating steps on next `match` call.
  this.__index__ = -1
  this.__last_index__ = -1 // Next scan position
  this.__schema__ = ''
  this.__text_cache__ = ''

  this.__schemas__ = assign({}, defaultSchemas, schemas)
  this.__compiled__ = {}

  this.__tlds__ = tlds_default
  this.__tlds_replaced__ = false

  this.re = {}

  compile(this)
}

/** chainable
 * LinkifyIt#add(schema, definition)
 * - schema (String): rule name (fixed pattern prefix)
 * - definition (String|RegExp|Object): schema definition
 *
 * Add new rule definition. See constructor description for details.
 **/
LinkifyIt.prototype.add = function add (schema, definition) {
  this.__schemas__[schema] = definition
  compile(this)
  return this
}

/** chainable
 * LinkifyIt#set(options)
 * - options (Object): { fuzzyLink|fuzzyEmail|fuzzyIP: true|false }
 *
 * Set recognition options for links without schema.
 **/
LinkifyIt.prototype.set = function set (options) {
  this.__opts__ = assign(this.__opts__, options)
  return this
}

/**
 * LinkifyIt#test(text) -> Boolean
 *
 * Searches linkifiable pattern and returns `true` on success or `false` on fail.
 **/
LinkifyIt.prototype.test = function test (text) {
  // Reset scan cache
  this.__text_cache__ = text
  this.__index__ = -1

  if (!text.length) { return false }

  let m, ml, me, len, shift, next, re, tld_pos, at_pos

  // try to scan for link with schema - that's the most simple rule
  if (this.re.schema_test.test(text)) {
    re = this.re.schema_search
    re.lastIndex = 0
    while ((m = re.exec(text)) !== null) {
      len = this.testSchemaAt(text, m[2], re.lastIndex)
      if (len) {
        this.__schema__ = m[2]
        this.__index__ = m.index + m[1].length
        this.__last_index__ = m.index + m[0].length + len
        break
      }
    }
  }

  if (this.__opts__.fuzzyLink && this.__compiled__['http:']) {
    // guess schemaless links
    tld_pos = text.search(this.re.host_fuzzy_test)
    if (tld_pos >= 0) {
      // if tld is located after found link - no need to check fuzzy pattern
      if (this.__index__ < 0 || tld_pos < this.__index__) {
        if ((ml = text.match(this.__opts__.fuzzyIP ? this.re.link_fuzzy : this.re.link_no_ip_fuzzy)) !== null) {
          shift = ml.index + ml[1].length

          if (this.__index__ < 0 || shift < this.__index__) {
            this.__schema__ = ''
            this.__index__ = shift
            this.__last_index__ = ml.index + ml[0].length
          }
        }
      }
    }
  }

  if (this.__opts__.fuzzyEmail && this.__compiled__['mailto:']) {
    // guess schemaless emails
    at_pos = text.indexOf('@')
    if (at_pos >= 0) {
      // We can't skip this check, because this cases are possible:
      // 192.168.1.1@gmail.com, my.in@example.com
      if ((me = text.match(this.re.email_fuzzy)) !== null) {
        shift = me.index + me[1].length
        next = me.index + me[0].length

        if (this.__index__ < 0 || shift < this.__index__ ||
            (shift === this.__index__ && next > this.__last_index__)) {
          this.__schema__ = 'mailto:'
          this.__index__ = shift
          this.__last_index__ = next
        }
      }
    }
  }

  return this.__index__ >= 0
}

/**
 * LinkifyIt#pretest(text) -> Boolean
 *
 * Very quick check, that can give false positives. Returns true if link MAY BE
 * can exists. Can be used for speed optimization, when you need to check that
 * link NOT exists.
 **/
LinkifyIt.prototype.pretest = function pretest (text) {
  return this.re.pretest.test(text)
}

/**
 * LinkifyIt#testSchemaAt(text, name, position) -> Number
 * - text (String): text to scan
 * - name (String): rule (schema) name
 * - position (Number): text offset to check from
 *
 * Similar to [[LinkifyIt#test]] but checks only specific protocol tail exactly
 * at given position. Returns length of found pattern (0 on fail).
 **/
LinkifyIt.prototype.testSchemaAt = function testSchemaAt (text, schema, pos) {
  // If not supported schema check requested - terminate
  if (!this.__compiled__[schema.toLowerCase()]) {
    return 0
  }
  return this.__compiled__[schema.toLowerCase()].validate(text, pos, this)
}

/**
 * LinkifyIt#match(text) -> Array|null
 *
 * Returns array of found link descriptions or `null` on fail. We strongly
 * recommend to use [[LinkifyIt#test]] first, for best speed.
 *
 * ##### Result match description
 *
 * - __schema__ - link schema, can be empty for fuzzy links, or `//` for
 *   protocol-neutral  links.
 * - __index__ - offset of matched text
 * - __lastIndex__ - index of next char after mathch end
 * - __raw__ - matched text
 * - __text__ - normalized text
 * - __url__ - link, generated from matched text
 **/
LinkifyIt.prototype.match = function match (text) {
  const result = []
  let shift = 0

  // Try to take previous element from cache, if .test() called before
  if (this.__index__ >= 0 && this.__text_cache__ === text) {
    result.push(createMatch(this, shift))
    shift = this.__last_index__
  }

  // Cut head if cache was used
  let tail = shift ? text.slice(shift) : text

  // Scan string until end reached
  while (this.test(tail)) {
    result.push(createMatch(this, shift))

    tail = tail.slice(this.__last_index__)
    shift += this.__last_index__
  }

  if (result.length) {
    return result
  }

  return null
}

/**
 * LinkifyIt#matchAtStart(text) -> Match|null
 *
 * Returns fully-formed (not fuzzy) link if it starts at the beginning
 * of the string, and null otherwise.
 **/
LinkifyIt.prototype.matchAtStart = function matchAtStart (text) {
  // Reset scan cache
  this.__text_cache__ = text
  this.__index__ = -1

  if (!text.length) return null

  const m = this.re.schema_at_start.exec(text)
  if (!m) return null

  const len = this.testSchemaAt(text, m[2], m[0].length)
  if (!len) return null

  this.__schema__ = m[2]
  this.__index__ = m.index + m[1].length
  this.__last_index__ = m.index + m[0].length + len

  return createMatch(this, 0)
}

/** chainable
 * LinkifyIt#tlds(list [, keepOld]) -> this
 * - list (Array): list of tlds
 * - keepOld (Boolean): merge with current list if `true` (`false` by default)
 *
 * Load (or merge) new tlds list. Those are user for fuzzy links (without prefix)
 * to avoid false positives. By default this algorythm used:
 *
 * - hostname with any 2-letter root zones are ok.
 * - biz|com|edu|gov|net|org|pro|web|xxx|aero|asia|coop|info|museum|name|shop|рф
 *   are ok.
 * - encoded (`xn--...`) root zones are ok.
 *
 * If list is replaced, then exact match for 2-chars root zones will be checked.
 **/
LinkifyIt.prototype.tlds = function tlds (list, keepOld) {
  list = Array.isArray(list) ? list : [list]

  if (!keepOld) {
    this.__tlds__ = list.slice()
    this.__tlds_replaced__ = true
    compile(this)
    return this
  }

  this.__tlds__ = this.__tlds__.concat(list)
    .sort()
    .filter(function (el, idx, arr) {
      return el !== arr[idx - 1]
    })
    .reverse()

  compile(this)
  return this
}

/**
 * LinkifyIt#normalize(match)
 *
 * Default normalizer (if schema does not define it's own).
 **/
LinkifyIt.prototype.normalize = function normalize (match) {
  // Do minimal possible changes by default. Need to collect feedback prior
  // to move forward https://github.com/markdown-it/linkify-it/issues/1

  if (!match.schema) { match.url = 'http://' + match.url }

  if (match.schema === 'mailto:' && !/^mailto:/i.test(match.url)) {
    match.url = 'mailto:' + match.url
  }
}

/**
 * LinkifyIt#onCompile()
 *
 * Override to modify basic RegExp-s.
 **/
LinkifyIt.prototype.onCompile = function onCompile () {
}

export default LinkifyIt
>>>>>>> dev:vendor/javascript/linkify-it.js
