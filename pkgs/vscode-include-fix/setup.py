from setuptools import setup, find_packages

setup(
    name='src',
    version="1.0.0",
    description='python interface to vscode-include-fix',
    author='yxb',

    packages=find_packages(),
    include_package_data=True,
    entry_points={
        'console_scripts': [
            'vscode-include-fix=src.cli:main',
        ]
    },
    zip_safe=False,
    install_requires=[
        'click',
    ],
    python_requires='>=3.6',
)
