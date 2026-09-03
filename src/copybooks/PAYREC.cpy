      * Layout sintético de transação de pagamento.
       01  PAYMENT-RECORD.
           05  PAY-TRANSACTION-ID      PIC X(16).
           05  PAY-CLIENT-ID           PIC X(12).
           05  PAY-AMOUNT              PIC 9(11)V99.
           05  PAY-CURRENCY            PIC X(03).
           05  PAY-CHANNEL             PIC X(10).
           05  PAY-STATUS              PIC X(02).
           05  PAY-REASON-CODE         PIC X(04).
