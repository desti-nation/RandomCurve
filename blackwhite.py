import os
import numpy as np
from PIL import Image


imgs_dir = r"C:\Users\jacky\Desktop\TestData\imgs"
files = sorted(os.listdir(imgs_dir))

for i, f in enumerate(files):
    img_name = os.path.join(imgs_dir, f)
    np_imgs = np.asarray(Image.open(img_name))
    np_imgs = 255 - np_imgs
    img = Image.fromarray(np_imgs)
    img.save(img_name)

