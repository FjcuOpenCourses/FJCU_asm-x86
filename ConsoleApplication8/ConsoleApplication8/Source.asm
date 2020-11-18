.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwexitcode:DWORD

includelib legacy_stdio_definitions.lib


printf PROTO C,
    format:PTR BYTE, args:VARARG
scanf PROTO C,
    format:PTR BYTE, args:VARARG