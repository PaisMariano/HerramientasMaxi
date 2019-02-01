CLOSE ALL
CLEAR ALL
CLEAR
WAIT WINDOW 'COMPILING - please wait' NOWAIT
DO "D:\Utilitarios MaxiREST\Proyecto\instaladorNuevo3\instalar.exe_compile_data_.prg"
SET BELL TO ('C:\WINDOWS\Media\tada.wav')
?? CHR(7)
WAIT WINDOW 'FINISHED'
QUIT
