$pdf_mode = 1;
$postscript_mode = 0;
$dvi_mode = 0;

$view = 'pdf';
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode --shell-escape %O %S';
$preview_continuous_mode = 1;
$cleanup_includes_cusdep_generated = 1;
$cleanup_includes_generated = 1;

$pdf_previewer = 'open -a Skim';
