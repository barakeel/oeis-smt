;; sequence(s): A59997
;; terms: 14 51 120 230 390 609 896 1260 1710 2255 2904 3666 4550 5565 6720 8024 9486 11115 12920 14910
;; small program: (loop(((x + y) + y) + y, 2 + x, x) - 2) * (2 + x)
;; fast program: (2 + ((1 + 2) * (2 + (2 + x)))) * (((1 + x) * (2 + x)) div 2)
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int Int) Int)
(declare-fun g0 (Int) Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int) (y Int)) (= (f0 x y) (+ (+ (+ x y) y) y))))
(assert (forall ((x Int)) (= (g0 x) (+ 2 x))))
(assert (forall ((x Int)) (= (h0 x) x)))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y) x)))))
(assert (forall ((x Int)) (= (v0 x) (u0 (g0 x) (h0 x)))))
(assert (forall ((x Int)) (= (small x) (* (- (v0 x) 2) (+ 2 x)))))
(assert (forall ((x Int)) (= (fast x) (* (+ 2 (* (+ 1 2) (+ 2 (+ 2 x)))) (divf (* (+ 1 x) (+ 2 x)) 2)))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
