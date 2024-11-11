from datetime import datetime
import os
from django.http import HttpRequest
from django.shortcuts import redirect, render
from arsipbws.settings import MEDIA_ROOT
from surat.models import SuratMasukModel
from masterdata.models import (
    BalaiModel,
    KlasifikasiModel,
    SukuMasalahModel,
    TandaTanganModel,
)
from .forms import *
import ast


# Create your views here.
def daftar_suratmasuk_page(request: HttpRequest):

    query = SuratMasukModel.objects.all()
    data = []
    for i in query:
        filename = f"{i.file}".split("surat_masuk/")
        reverse_filename = "surat_masuk\\".join(filename)
        data.append(
            {
                "tgl": i.tgl_surat,
                "noSurat": ast.literal_eval(i.no_surat)[0],
                "hal": i.hal,
                "doc": reverse_filename,
            }
        )

    context = dict(
        titlepage="Surat Masuk",
        page="suratmasuk",
        data=data,
    )
    return render(request, "pages/suratmasuk/surat_masuk_page.html", context)


def tambah_suratmasuk_page(request: HttpRequest):
    form = SuratMasukForm()

    if request.method == "POST":
        hal = request.POST["hal"]
        no_surat = request.POST["noSurat"]
        tgl_surat = request.POST["tglSurat"]
        file = request.FILES["lampiran"]

        # ext = file.name.split(".")[-1]
        # dt = datetime.now()
        # time = f"{dt.second}{dt.minute}{dt.hour}"
        # date = f"{dt.day}{dt.month}{dt.year}"
        # filename = f"sm_{time}_{date}_{no_surat}.{ext}"
        # path_file = os.path.join(MEDIA_ROOT, filename)

        data = SuratMasukModel(
            no_surat=f"{no_surat}",
            tgl_surat=tgl_surat,
            hal=hal,
            file=file,
        )

        print(f"No Surat : {no_surat}")

        data.save()

        return redirect("surat:daftarsuratmasuk")

    context = dict(
        titlepage="Tambah Surat Masuk",
        page="suratmasuk",
        form=form,
    )
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
