from django import forms
from suratkeluar.models import SuratKeluarModel


class SuratKeluarForm(forms.Form):
    klasifikasi = forms.ChoiceField(
        label="Klasifikasi",
        choices=[("", "-- Pilih --")],
        widget=forms.Select(attrs={"class": "form-control"}),
    )
    masalahPokok = forms.ChoiceField(
        label="Masalah Pokok",
        choices=[("", "-- Pilih --")],
        widget=forms.Select(attrs={"class": "form-control"}),
    )
    bagianMasalah = forms.ChoiceField(
        label="Bagian Masalah",
        choices=[("", "-- Pilih --")],
        widget=forms.Select(attrs={"class": "form-control"}),
    )
    sukuMasalah = forms.ChoiceField(
        label="Suku Masalah",
        choices=[("", "-- Pilih --")],
        widget=forms.Select(attrs={"class": "form-control"}),
    )

    kodeBalai = forms.ChoiceField(
        label="Kode Balai",
        choices=[("", "-- Pilih--")],
        widget=forms.Select(attrs={"class": "form-control"}),
    )

    tglSurat = forms.DateField(
        label="Tanggal Surat",
        widget=forms.DateInput(attrs={"class": "form-control", "type": "date"}),
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

    ttdSurat = forms.ChoiceField(
        label="TTD Surat",
        choices=[("", "-- Pilih --")],
        widget=forms.Select(attrs={"class": "form-control"}),
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

    noUrut = forms.CharField(
        label="No. Urut",
        widget=forms.TextInput(
            attrs={
                "class": "form-control",
                "placeholder": "Ex. 163",
            },
        ),
    )

    class Meta:
        model = SuratKeluarModel
        fields = "__all__"
