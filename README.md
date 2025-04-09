This repository contains an end-to-end data engineering pipeline designed to analyse Ubisoft’s market performance and community sentiment through a Retrieval-Augmented Generation (RAG) framework. It combines structured data (e.g., stock prices, review counts) and unstructured content (e.g., Steam reviews, Reddit discussions, Ubisoft press releases) to support complex natural language queries using LangChain agents and LLMs.

The pipeline is optimised for enterprise use, featuring:

* Apache Spark for scalable data transformations
* SentenceTransformer + FAISS for semantic search over user feedback
* LangChain tools + OpenAI API for intelligent Q&A
* Dockerized environment for reproducible setup and deployment

## Project Structure

The pipeline is implemented across three Jupyter notebooks:
1. data_collection.ipynb
  * Raw data extraction from:
  * Yahoo Finance (UBI.PA)
  * Steam Reviews API (Assassin's Creed Shadows)
  * Reddit (via PRAW)
  * Ubisoft News (via Selenium)
2. data_transformation.ipynb
  * Spark-based transformation of structured metrics
  * Sentiment annotation (TextBlob + VADER)
  * Text chunking, embedding (SentenceTransformer), and FAISS indexing
3. data_RAG.ipynb
  * LangChain tool definitions for structured/unstructured querying
  * LLM agent setup (GPT-4o-mini)
  * Natural language Q&A with dynamic tool selection

## How to Use (Docker Setup)

To launch the Jupyter environment using Docker:

docker run -p 8888:8888 -v $(pwd):/home/jovyan/work --env-file .env ubisoft_pipeline

 Ensure you have a .env file containing your API credentials (e.g., OpenAI, Reddit).
 All .parquet, .index, and .json outputs are written to the data/ folder.

Once inside the container, run each notebook in order:
1. data_collection.ipynb
2. data_transformation.ipynb
3. data_RAG.ipynb
