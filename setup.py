from setuptools import setup, find_packages

setup(
    name="sample_project",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        "requests>=2.26.0",
    ],
    author="Sanjay",
    author_email="sanjaypramod.p@gmail.com",
    description="A simple sample Python project",
    # Uncomment the next line if you have a README.md file
    # long_description=open("README.md").read(),
    long_description_content_type="text/markdown",
    url="https://github.com/yourusername/sample_project",
    classifiers=[
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    python_requires='>=3.6',
)

