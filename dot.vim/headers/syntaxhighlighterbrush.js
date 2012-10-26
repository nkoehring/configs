:insert
SyntaxHighlighter.brushes.Custom = function()
{
    var funcs       = '';
    var keywords    = '';
    var operators   = '';
 
    this.regexList = [
        { regex: /--(.*)$/gm,                                               css: 'comments' },
        { regex: SyntaxHighlighter.regexLib.multiLineDoubleQuotedString,    css: 'string' },
        { regex: new RegExp(this.getKeywords(funcs), 'gmi'),                css: 'color2' },
        { regex: new RegExp(this.getKeywords(operators), 'gmi'),            css: 'color1' },
        { regex: new RegExp(this.getKeywords(keywords), 'gmi'),             css: 'keyword' }
        ];
};
SyntaxHighlighter.brushes.Custom.prototype = new SyntaxHighlighter.Highlighter();
SyntaxHighlighter.brushes.Custom.aliases    = ['custom', 'ctm', 'ct'];
.
