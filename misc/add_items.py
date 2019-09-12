import os
import sys

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'Django2ByExamples.settings')

import django
django.setup()

from blog.models import Post
from django.contrib.auth.models import User
from faker import Faker
from random import randint
from taggit.models import Tag


def add_posts(N):
    fake = Faker()

    admin = User.objects.get(username='admin_igor')
    demo_user = User.objects.get(username='demo_user')

    # create N posts
    for i in range(N):
        title = fake.sentence(nb_words=6, variable_nb_words=True, ext_word_list=None)
        slug = title.replace(' ', '-').replace('.', '').lower()
        author = demo_user if randint(0, 1) >= 1 else admin
        body = ''.join(fake.texts(nb_texts=3, max_nb_chars=200, ext_word_list=None))
        status = 'published'

        Post.objects.create(title=title,
                            slug=slug,
                            author=author,
                            body=body,
                            status=status)


def add_tags_to_posts():
    # add tags to posts
    for _id in Post.objects.values_list('id', flat=True):
        tags = Tag.objects.values_list('name', flat=True)[randint(0, 5)]    # randomly take tag
        post = Post.objects.get(id=_id)

        if _id > 9:
            post.tags.add(tags)
        else:
            continue


def main():
    add_posts(10)
    add_tags_to_posts()


if __name__ == '__main__':
    main()
