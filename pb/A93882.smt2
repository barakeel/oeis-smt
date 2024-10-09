;; sequence(s): A93882-A138953
;; terms: 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9 10
;; small program: (((x div 2) div (1 + (2 + 2))) + (x mod (2 + (2 * (2 + 2))))) mod (if x <= 0 then 1 else x)
;; fast program: (x - ((1 + (2 * (2 + 2))) * (x div (2 + (2 * (2 + 2)))))) mod (if x <= 0 then 1 else x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(define-fun modf ((a Int) (b Int)) Int (ite (< 0 b) (mod a b) (- (mod (- a) (- b)))))
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (small x) (modf (+ (divf (divf x 2) (+ 1 (+ 2 2))) (modf x (+ 2 (* 2 (+ 2 2))))) (ite (<= x 0) 1 x)))))
(assert (forall ((x Int)) (= (fast x) (modf (- x (* (+ 1 (* 2 (+ 2 2))) (divf x (+ 2 (* 2 (+ 2 2)))))) (ite (<= x 0) 1 x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
