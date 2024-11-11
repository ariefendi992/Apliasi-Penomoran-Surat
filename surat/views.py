from django.http import HttpRequest
from django.shortcuts import redirect, render

from masterdata.models import (
    BalaiModel,
    KlasifikasiModel,
    SukuMasalahModel,
    TandaTanganModel,
)
from .forms import *


# Create your views here.
def daftar_suratmasuk_page(request: HttpRequest):

    context = dict(titlepage="Surat Masuk", page="suratmasuk")
    return render(request, "pages/suratmasuk/surat_masuk_page.html", context)


def tambah_suratmasuk_page(request: HttpRequest):

    context = dict(titlepage="Tambah Surat Masuk", page="tambahsuratmasuk")
    return render(request, "pages/suratmasuk/tambah_suratmasuk_page.html", context)


def daftar_suratkeluar_page(request):
    query_surat = SuratKeluarModel.objects.all()
    data_surat = []
    for i in query_surat:
        no_surat = (
            f"{i.suku_masalah.bagianmasalah.masalahpokok.kode}.{i.suku_masalah.bagianmasalah.kode}.{i.suku_masalah.kode}-{i.kode_balai.kode_balai}.{i.ttd.kode}/{i.no_urut}"
            if i.ttd.kode is not None
            else f"{i.suku_masalah.bagianmasalah.masalahpokok.kode}.{i.suku_masalah.bagianmasalah.kode}.{i.suku_masalah.kode}-{i.kode_balai.kode_balai}/{i.no_urut}"
        )
        filename = f"{i.file}".split("surat_keluar/")
        reverse_filename = f"surat_keluar\\".join(filename)
        data_surat.append(
            {
                "tgl": i.tgl_surat,
                "noSurat": no_surat,
                "hal": i.hal,
                "doc": reverse_filename,
            }
        )

    context = dict(
        titlepage="Surat Keluar",
        page="suratkeluar",
        data=data_surat,
    )
    return render(request, "pages/suratkeluar/surat_keluar_page.html", context)


def tambah_suratkeluar_page(request: HttpRequest):
    form = SuratKeluarForm()
    klasifikasi_query = KlasifikasiModel.objects.all()
    kode_balai = BalaiModel.objects.all()
    ttd = TandaTanganModel.objects.all()

    for i in klasifikasi_query:
        form["klasifikasi"].field.choices += [(i.id, i.klasifikasi_arsip.title())]
    for i in kode_balai:
        form["kodeBalai"].field.choices += [(i.id, i.kode_balai.upper())]

    for i in ttd:
        form["ttdSurat"].field.choices += [(i.pk, i.tertanda)]

    if request.method == "POST":
        suku_masalah_id = request.POST["sukuMasalah"]
        kode_balai_id = request.POST["kodeBalai"]
        tgl_surat = request.POST["tglSurat"]
        hal = request.POST["hal"]
        ttd_id = request.POST["ttdSurat"]
        lampiran = request.FILES["lampiran"]
        no_urut = request.POST["noUrut"]
        suku_masalah = SukuMasalahModel.objects.get(pk=suku_masalah_id)
        kode_balai = BalaiModel.objects.get(pk=kode_balai_id)
        ttd = TandaTanganModel.objects.get(pk=ttd_id)

        data = SuratKeluarModel(
            suku_masalah=suku_masalah,
            kode_balai=kode_balai,
            tgl_surat=tgl_surat,
            hal=hal,
            ttd=ttd,
            no_urut=no_urut,
            file=lampiran,
        )

        data.save()
        # if form.is_valid():
        #     form.save(commit=False)
        return redirect("surat:daftarsuratkeluar")

    context = dict(
        titlepage="Surat Keluar",
        page="suratkeluar",
        form=form,
    )
    return render(request, "pages/suratkeluar/tambah_suratkeluar_page.html", context)
