from fastapi import FastAPI
from pydantic import BaseModel
from datetime import datetime

from notifier import send_email   # ✅ CORRECT IMPORT

app = FastAPI()

class StudentInput(BaseModel):
    student_id: int
    attendance: float
    marks: float
    attempts: int
    guardian_email: str
    mentor_email: str


def predict_risk(attendance, marks, attempts):
    if attendance < 60 or marks < 40 or attempts >= 3:
        return "HIGH RISK", "Immediate counselling required."
    return "LOW RISK", "Student performing well."


@app.post("/predict")
def predict(data: StudentInput):
    risk, message = predict_risk(
        data.attendance,
        data.marks,
        data.attempts
    )

    if risk == "HIGH RISK":
        send_email(data.guardian_email, "Student At Risk", message)
        send_email(data.mentor_email, "Student At Risk", message)

    return {
        "student_id": data.student_id,
        "risk_level": risk,
        "message": message,
        "timestamp": datetime.now().isoformat()
    }
