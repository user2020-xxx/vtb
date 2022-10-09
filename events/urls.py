from django.urls import path
from events import views

urlpatterns = [
    path("event/<slug:slug_event>/add/<int:pk>/", views.join_user_to_event, name="Добавить пользователя в событие"),
    path("event/preset=<slug:preset>/", views.get_filters, name="Добавить пользователя в событие"),
    path("event/<slug:slug_event>/remove/<int:pk>/", views.remove_user_from_event,
         name="Удалить пользователя из события"),
    path("event/", views.ListEventAPIView.as_view(), name="Создать событие, вывести событие"),
    path("event/update/<int:pk>/", views.UpdateEventAPIView.as_view(), name="Обновить событие"),
    path("event/delete/<int:pk>/", views.DeleteEventAPIView.as_view(), name="Удалить событие"),
    path("event/user/<int:pk>/", views.get_event, name="Удалить событие"),
]
