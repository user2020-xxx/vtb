import re

from django.http import HttpResponse
from rest_framework import generics
from rest_framework import pagination
from .models import Event
from users.models import User
from .serializers import EventModelSerializer
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db.models import Count
from django.core.serializers import serialize
from .models import ArrayLength


@api_view(['GET', 'POST'])
def join_user_to_event(request, slug_event, pk):
        user = get_object_or_404(User, pk=pk)
        event = get_object_or_404(Event, slug=slug_event)
        event.participants.append(user.id)
        event.save()
        return Response('Success add user')


@api_view(['DELETE'])
def remove_user_from_event(request, slug_event, pk):
    user = get_object_or_404(User, pk=pk)
    event = get_object_or_404(Event, slug=slug_event)
    event.participants.remove(user.id)
    event.save()
    return Response("Success remove user")


class ListEventAPIView(generics.ListCreateAPIView):
    queryset = Event.objects.all()
    serializer_class = EventModelSerializer
    pagination_class = pagination.LimitOffsetPagination
    filterset_fields = ['id']


class UpdateEventAPIView(generics.UpdateAPIView):
    queryset = Event.objects.all()
    serializer_class = EventModelSerializer


class DeleteEventAPIView(generics.DestroyAPIView):
    queryset = Event.objects.all()
    serializer_class = EventModelSerializer



@api_view(['GET'])
def get_filters(request, preset):

    if preset == 'top':
        events = list(Event.objects.annotate(p_count=ArrayLength('participants')).order_by('p_count').reverse()[:3])
        json_data = serialize("json", events, fields=('id'))
        return HttpResponse(json_data, content_type="application/json")

    elif preset == 'popular':
        events = list(Event.objects.all().annotate(p_count=ArrayLength('participants')).order_by('p_count').reverse()[:10])
        json_data = serialize("json", events, fields=('id'))
        return HttpResponse(json_data, content_type="application/json")

    elif preset == 'nearest':
        events = list(Event.objects.all().order_by('datetime').reverse()[:10:-1])
        json_data = serialize("json", events, fields=('id'))
        return HttpResponse(json_data, content_type="application/json")

    elif preset == 'richest':
        events = Event.objects.all().order_by('prize').reverse()[:3]
        json_data = serialize("json", events, fields=('id'))
        return HttpResponse(json_data, content_type="application/json")


# @api_view(['GET'])
# def join_user_to_event(request, slug_event, pk):
#     user = get_object_or_404(User, pk=pk)
#     event = get_object_or_404(Event, slug=slug_event)
#     event.participants.add(user)
#     return Response('Success add user')

@api_view(['GET'])
def get_event(request, pk):
    set = Event.objects.all()
    data = set.filter(participants__icontains=str(pk))
    json_data = serialize("json", data)
    return Response(json_data, content_type="application/json")