from django.contrib.auth.base_user import BaseUserManager


class MyUserManager(BaseUserManager):
    def _create_user(self,username, email, password, **extra_fields):
        if not email:
            raise ValueError("Вы не ввели Email")
        if not username:
            raise ValueError("Вы не ввели Логин")

        user = self.model(
            email=self.normalize_email(email),
            username=username,
            **extra_fields,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, username, email, password):
        return self._create_user(username, email, password)

    def create_superuser(self, username, email, password):
        return self._create_user(username, email, password, is_staff=True, is_superuser=True)