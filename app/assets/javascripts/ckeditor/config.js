// The set of styles for the <b>Styles</b> drop-down list.
CKEDITOR.stylesSet.add( 'my_styles', [
  { name: 'Drop Cap', element: 'span', attributes: { 'class': 'dropcap' } },
  { name: 'Code', element: 'code' },
  { name: 'Cited Work', element: 'cite' },
  { name: 'Inline Quote', element: 'q' }
]);

CKEDITOR.editorConfig = function(config) {
  config.language  = 'en';
  config.uiColor   = 'F2F2F2';
  config.height    = 300;
  config.stylesSet = 'my_styles';

  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";

  config.toolbarGroups = [
    { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
    { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
    { name: 'editing', groups: [ 'find', 'selection', 'editing' ] },
    { name: 'forms', groups: [ 'forms' ] },
    { name: 'tools', groups: [ 'tools' ] },
    '/',
    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
    { name: 'styles', groups: [ 'styles' ] },
    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi', 'paragraph' ] },
    { name: 'links', groups: [ 'links' ] },
    { name: 'insert', groups: [ 'insert' ] },
    { name: 'colors', groups: [ 'colors' ] },

    { name: 'others', groups: [ 'others' ] },
    { name: 'about', groups: [ 'about' ] }
  ];

  config.removeButtons = 'Save,NewPage,Print,Templates,Form,Checkbox,Radio,TextField,Textarea,Select,Button,ImageButton,HiddenField,JustifyLeft,JustifyCenter,JustifyRight,JustifyBlock,BidiLtr,BidiRtl,Flash,Table,Smiley,Iframe,TextColor,BGColor,FontSize,Font,Anchor,Subscript,Superscript,CopyFormatting,CreateDiv,Language,About,Cut,Copy,Paste,Scayt,SelectAll,HorizontalRule,PageBreak';
};
