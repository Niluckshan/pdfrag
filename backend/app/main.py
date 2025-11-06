import os
from fastapi import FastAPI
from app.routers.uploads import router as uploads_router
from fastapi.middleware.cors import CORSMiddleware

ALLOWED_ORIGINS = os.getenv("ALLOWED_ORIGINS", "http://localhost:5173").split(",")

app = FastAPI(title="RAG MVP Backend", version="0.1.0")
app.add_middleware(
    CORSMiddleware,
    allow_origins=[o.strip() for o in ALLOWED_ORIGINS],
    allow_methods=["*"],
    allow_headers=["*"],
    allow_credentials=True,
)

@app.get("/api/health")
def health():
    return {"status": "ok"}

@app.get("/api/healthz")
def healthz():
    return {"status": "ok"}

# Alle Routen hier “zusammenstecken”
app.include_router(uploads_router, prefix="/api")
