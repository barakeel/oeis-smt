;; sequence(s): A187452
;; terms: 0 4 28 96 244 516 968 1664 2680 4100 6020 8544 11788 15876 20944 27136 34608 43524 54060 66400
;; small program: loop((x * x) + (((2 - x) * x) div (2 + (2 + 2))), 1, (2 + x) * x) div 2
;; fast program: loop((2 + ((2 * (x + x)) + x)) * x, 1, (2 + x) * x) div (2 * (2 + (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 (Int) Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 (Int) Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 (Int) Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 (Int) Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ (* x x) (divf (* (- 2 x) x) (+ 2 (+ 2 2)))))))
(assert (= g0 1))
(assert (forall ((x Int)) (= (h0 x) (* (+ 2 x) x))))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (forall ((x Int)) (= (v0 x) (u0 g0 (h0 x)))))
(assert (forall ((x Int)) (= (small x) (divf (v0 x) 2))))
(assert (forall ((x Int)) (= (f1 x) (* (+ 2 (+ (* 2 (+ x x)) x)) x))))
(assert (= g1 1))
(assert (forall ((x Int)) (= (h1 x) (* (+ 2 x) x))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (forall ((x Int)) (= (v1 x) (u1 g1 (h1 x)))))
(assert (forall ((x Int)) (= (fast x) (divf (v1 x) (* 2 (+ 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
