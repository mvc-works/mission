define(function() {

String.prototype.encodeHTML=function () {
      var encodeHTMLRules, matchHTML;
      encodeHTMLRules = {
        "&": "&#38;",
        "<": "&#60;",
        ">": "&#62;",
        '"': '&#34;',
        "'": '&#39;',
        "/": '&#47;'
      };
      matchHTML = /&(?!#?w+;)|<|>|"|'|\//g;
      return this.replace(matchHTML, function(m) {
        return encodeHTMLRules[m] || m;
      });
    };

var tmpl = {};

tmpl["html/panel.html"]=function anonymous(it) {
var out='<p>';{ it.name }out+='</p>';return out;
};

return tmpl;
});