;; sequence(s): A172525
;; terms: 111111111 222222222 333333333 444444444 555555555 666666666 777777777 888888888 999999999 1111111110 1222222221 1333333332 1444444443 1555555554 1666666665 1777777776 1888888887 1999999998 2111111109
;; small program: loop(1 + (2 * ((2 * (x + x)) + x)), 2 * (2 + 2), 1) * (1 + x)
;; fast program: ((loop((x * x) * x, 2, 2 + (2 * (2 + 2))) * (1 + x)) - x) div (1 + (2 * (2 + 2)))
(set-logic UFNIA)
(define-fun divf ((a Int) (b Int)) Int (ite (< 0 b) (div a b) (div (- a) (- b))))
(declare-fun f0 (Int) Int)
(declare-fun g0 () Int)
(declare-fun h0 () Int)
(declare-fun u0 (Int Int) Int)
(declare-fun v0 () Int)
(declare-fun small (Int) Int)
(declare-fun f1 (Int) Int)
(declare-fun g1 () Int)
(declare-fun h1 () Int)
(declare-fun u1 (Int Int) Int)
(declare-fun v1 () Int)
(declare-fun fast (Int) Int)
(assert (forall ((x Int)) (= (f0 x) (+ 1 (* 2 (+ (* 2 (+ x x)) x))))))
(assert (= g0 (* 2 (+ 2 2))))
(assert (= h0 1))
(assert (forall ((x Int) (y Int)) (= (u0 x y) (ite (<= x 0) y (f0 (u0 (- x 1) y))))))
(assert (= v0 (u0 g0 h0)))
(assert (forall ((x Int)) (= (small x) (* v0 (+ 1 x)))))
(assert (forall ((x Int)) (= (f1 x) (* (* x x) x))))
(assert (= g1 2))
(assert (= h1 (+ 2 (* 2 (+ 2 2)))))
(assert (forall ((x Int) (y Int)) (= (u1 x y) (ite (<= x 0) y (f1 (u1 (- x 1) y))))))
(assert (= v1 (u1 g1 h1)))
(assert (forall ((x Int)) (= (fast x) (divf (- (* v1 (+ 1 x)) x) (+ 1 (* 2 (+ 2 2)))))))
(assert (exists ((c Int)) (and (>= c 0) (not (= (small c) (fast c))))))
(check-sat)
