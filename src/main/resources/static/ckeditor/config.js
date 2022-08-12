CKEDITOR.editorConfig = function( config ) {
// Define changes to default configuration here. For example:
// config.language = 'fr';
// config.uiColor = '#AADC6E';
config.height = 600;
//config.uiColor = '#9AB8F3';
config.uiColor = '#D3D3D3';
config.enterMode = CKEDITOR.ENTER_BR; //엔터키 태그 1:<p>, 2:<br>, 3:<div>
config.font_defaultLabel = 'Malgun Gothic'; //기본글씨
config.font_names = '굴림체/Gulim;돋움체/Dotum;맑은 고딕/Malgun Gothic;';
config.fontSize_defaultLabel = '22px';
config.fontSize_sizes = '14/14px;18/18px;22/22px;24/24px;28/28px;36/36px;48/48px;72/72px;';
config.toolbar = [
{ name: 'basicstyles', items: [ 'Bold', 'Underline', 'Subscript', 'Superscript', '-', 'CopyFormatting', 'RemoveFormat' ] },
{ name: 'paragraph', items: [ 'NumberedList', 'BulletedList', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ] },
{ name: 'links', items: [ 'Link', 'Unlink' ] },
{ name: 'insert', items: [ 'Image', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar' ] },
{ name: 'clipboard', items: ['Copy', 'PasteText'] },
{ name: 'styles', items: ['Font', 'FontSize' ] },
{ name: 'colors', items: [ 'TextColor', 'BGColor' ] },
{ name: 'tools', items: [ 'Maximize' ] },
];
// Remove some buttons provided by the standard plugins, which are
// not needed in the Standard(s) toolbar.
config.removeButtons = 'Underline,Subscript,Superscript';
// Set the most common block elements.
config.format_tags = 'p;h1;h2;h3;pre';
// Simplify the dialog windows.
config.removeDialogTabs = 'image:advanced;link:advanced';
config.filebrowserBrowseUrl = "/ckfinder/ckfinder.html";
config.filebrowserFlashBrowseUrl = "/ckfinder/ckfinder.html?type=Flash";
config.filebrowserUploadUrl = "/ckfinder/core/connector/java/connctor.java?command=QuickUpload&type=Files";
config.filebrowserImageUploadUrl = "/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Images";
config.filebrowserFlashUploadUrl = "/ckfinder/core/connector/java/connector.java?command=QuickUpload&type=Flash";
};