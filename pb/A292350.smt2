;; sequence(s): A292350
;; terms: 0 9 116 670 2580 7735 19544 43596 88440 166485 295020 497354 804076 1254435 1897840 2795480 4022064 5667681 7839780 10665270
;; small program: ((((1 + x) * ((2 + x) * x)) div (1 + 2)) * (loop((x * x) * x, 1, 1 + x) + x)) div 2
;; fast program: (((1 + x) * ((2 + x) * x)) div (2 + (2 + 2))) * (((1 + ((2 + x) * x)) * (1 + x)) + x)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (* (* x x) x))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (+ 1 x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (* (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 1 2)) (+ (v0 x) x)) 2))))
(assert (forall ((x Int)) (= (fast x) (* (divf (* (+ 1 x) (* (+ 2 x) x)) (+ 2 (+ 2 2))) (+ (* (+ 1 (* (+ 2 x) x)) (+ 1 x)) x)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
