

## What is all this about?

SciCluster, also known as Sci-HPC, is another computing cluster which is designed and implemented according to the academic standards, in order to do researches more extensive and qualitative. This being said, it is the first and only academic cumputing cluster in Iran.

خوشه دانشکده علوم دانشگاه فردوسی مشهد یک سرویس محاسباتی است با بالاترین کارایی و عملکرد که بر اساس نیازهای آکادمیک، به منظور انجام پژوهش‌های گسترده و اساسی‌تر، پیاده‌سازی شده‌است. با درنظر گرفتن این مهم، سای‌کلاستر یک سرویس HPC استاندارد آکادمیک در ایران است.

## License

Text is licensed under [CC-BY 4.0](https://creativecommons.org/licenses/by/4.0/),
code examples are provided under the [MIT](https://opensource.org/licenses/MIT) license.


## Locally building the HTML for testing

```
git clone https://github.com/smhr/scicluster.git
cd scicluster
virtualenv venv
source venv/bin/activate
pip install sphinx
pip install sphinx_rtd_theme
sphinx-build . _build
```

Then point your browser to `_build/index.html`.


## Getting started with RST and Sphinx

- http://sphinx-doc.org/rest.html
- http://sphinx-doc.org/markup/inline.html#cross-referencing-arbitrary-locations
