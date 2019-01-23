# -*- coding: utf-8 -*-
# Generated by Django 1.11 on 2019-01-15 22:45
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('projets', '0014_auto_20190115_2237'),
    ]

    operations = [
        migrations.AddField(
            model_name='projet',
            name='finance_requis_projet',
            field=models.DecimalField(blank=True, decimal_places=2, default=0.0, max_digits=6, verbose_name='Financement réquis'),
        ),
    ]
