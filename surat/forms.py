from django import forms


class FormTambahSuratKeluar(forms.Form):
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
