from django import forms


class SuratMasukForm(forms.Form):
    tglSurat = forms.DateField(
        label="Tanggal Surat",
        widget=forms.DateInput(attrs={"class": "form-control", "type": "date"}),
    )
    noSurat = forms.CharField(
        label="No. Surat",
        widget=forms.TextInput(
            attrs={"class": "form-control"},
        ),
    )
    hal = forms.CharField(
        label="Hal",
        widget=forms.Textarea(
            attrs={
                "class": "form-control",
                "placeholder": "Hal Surat",
                "rows": 2,
            }
        ),
    )

    lampiran = forms.FileField(
        label="File Surat",
        widget=forms.FileInput(
            attrs={
                "class": "custom-file-input",
                "id": "customFile",
                "type": "file",
            }
        ),
    )
