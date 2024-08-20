from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin,
)

# Create your models here.


class UserManager(BaseUserManager):
    def create_user(self, username, nama, password=None, **args):
        if not username:
            raise ValueError("Akun ini membutuhkan username!")

        user = self.model(username=username, nama=nama, **args)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, nama, password):
        user = self.create_user(username=username, nama=nama, password=password)
        user.is_admin = True
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


class UserModel(AbstractBaseUser, PermissionsMixin):
    username = models.CharField(max_length=64, unique=True)
    nama = models.CharField(max_length=128)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = "username"
    REQUIRED_FIELDS = ["nama"]

    class Meta:
        verbose_name_plural = "Users"

    def __str__(self):
        return self.nama

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True
