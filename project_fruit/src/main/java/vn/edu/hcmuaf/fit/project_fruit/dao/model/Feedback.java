package vn.edu.hcmuaf.fit.project_fruit.dao.model;

import java.io.Serializable;

public class Feedback implements Serializable {
        private int idFeedback;
        private int idProduct;
        private String cusName;
        private String content;
        private String dateCreate;
        private double rating;

    public Feedback(int idFeedback, int idProduct, String cusName, String content, String dateCreate, double rating) {
        this.idFeedback = idFeedback;
        this.idProduct = idProduct;
        this.cusName = cusName;
        this.content = content;
        this.dateCreate = dateCreate;
        this.rating = rating;
    }

    // Getter và Setter cho các thuộc tính
        public int getIdFeedback() {
            return idFeedback;
        }

        public void setIdFeedback(int idFeedback) {
            this.idFeedback = idFeedback;
        }

        public int getIdProduct() {
            return idProduct;
        }

        public void setIdProduct(int idProduct) {
            this.idProduct = idProduct;
        }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public String getDateCreate() {
            return dateCreate;
        }

        public void setDateCreate(String dateCreate) {
            this.dateCreate = dateCreate;
        }

        public double getRating() {
            return rating;
        }

        public void setRating(double rating) {
            this.rating = rating;
        }

    @Override
    public String toString() {
        return "Feedback{" +
                "idFeedback=" + idFeedback +
                ", idProduct=" + idProduct +
                ", cusName=" + cusName +
                ", content='" + content + '\'' +
                ", dateCreate='" + dateCreate + '\'' +
                ", rating=" + rating +
                '}';
    }
}


