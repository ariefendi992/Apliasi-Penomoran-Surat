from django.shortcuts import render
from django.http import HttpRequest, JsonResponse
from masterdata.models import *


# Create your views here.
def tes_data_api(request):

    data = {"id": 1, "nana": "Ok"}

    return JsonResponse(data=data, safe=False)


def get_maslah_pokok(request):
    klasifikasi_id = request.GET.get("q")
    if klasifikasi_id:
        masalah_pokok = MasalahPokokModel.objects.filter(klasifikasi=klasifikasi_id)

        if not masalah_pokok:
            data = {"status": False, "data": "Tidak diketahui"}

            return JsonResponse(data=data, safe=False)
        else:
            group_data = {"status": True, "data": []}
            for i in masalah_pokok:
                group_data["data"].append(
                    {
                        "id": i.id,
                        "kode": i.kode,
                        "masalah_pokok": i.masalah_pokok,
                    }
                )

            return JsonResponse(data=group_data, safe=False)
    else:
        return JsonResponse(
            data={"statu": False, "data": "Tidak diketahui."}, safe=False
        )


def get_bagian_masalah(request):
    masalah_pokok_id = request.GET.get("q")

    bagian_masalah = BagianMasalahModel.objects.filter(
        masalahpokok=masalah_pokok_id
    ).all()

    if not bagian_masalah:
        data = {
            "status": False,
            "msg": "Data tidak diketahui!",
            "data": None,
        }
        return JsonResponse(data=data)

    else:
        group_data = {
            "status": True,
            "msg": "Data ada",
            "data": [],
        }

        for i in bagian_masalah:
            group_data["data"].append(
                {
                    "id": i.id,
                    "kode": i.kode,
                    "bagian_masalah": i.bagian_masalah.title(),
                }
            )

        return JsonResponse(data=group_data, status=200)


def get_suku_masalah(request: HttpRequest):
    bagian_masalah_id = request.GET.get("q")

    if bagian_masalah_id:
        group_data = {"status": True, "data": []}
        suku_masalah = SukuMasalahModel.objects.filter(bagianmasalah=bagian_masalah_id)
        for i in suku_masalah:
            group_data["data"].append(
                {
                    "id": i.id,
                    "kode": i.kode,
                    "suku_masalah": i.suku_masalah,
                }
            )

        return JsonResponse(data=group_data, safe=False)
    else:
        return JsonResponse(data={"msg": "Tidak ada data."})


def get_kode_balai(request: HttpRequest):
    kode_balai_id = request.GET.get("q")
    group_data = {
        "status": True,
    }
    if kode_balai_id:

        balai_model = BalaiModel.objects.filter(id=kode_balai_id).first()

        if balai_model:
            group_data["data"] = {
                "id": balai_model.id,
                "kode": balai_model.kode_balai,
                "nama_balai": balai_model.nama_balai,
            }

        else:
            group_data["status"] = False
            group_data["msg"] = "Data tidak ditemukan!"

    else:
        balai_model = BalaiModel.objects.all()
        group_data["data"] = []
        for i in balai_model:
            group_data["data"].append(
                {"id": i.id, "kode": i.kode_balai, "nama_balai": i.nama_balai}
            )

    return JsonResponse(data=group_data, safe=False)
